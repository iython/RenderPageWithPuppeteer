#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import requests
import json
import sys
import asyncio
from pyppeteer.launcher import connect


async def main(url):
    try:
        r = requests.get("http://xxx.xxx.xxx.xxx:9222/json/version", timeout=2)
        r_dict = json.loads(r.text)
    except Exception as e:
        return e
    browserWSEndpoint = r_dict["webSocketDebuggerUrl"]
    browser = await connect({'browserWSEndpoint': browserWSEndpoint})
    page = await browser.newPage()
    # await page.setUserAgent("Mozilla/5.0")
    try:
        await page.goto(url, timeout=5000)
        # await page.waitFor(2000)
        content = await page.content()
        # print(content)
        await page.close()
    except Exception as e:
        content = str(e)
    return content

if __name__ == "__main__":
    url = sys.argv[1]
    content = asyncio.get_event_loop().run_until_complete(main(url))
    print(content)
