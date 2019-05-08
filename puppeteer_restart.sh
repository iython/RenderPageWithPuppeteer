#!/bin/bash
output=`curl -s -X GET http://0.0.0.0:9222/json/version`
if [[ $output != {* ]];
then
    docker run -d -p 9222:9222 <image_id> /home/xyz/puppeteer/chromium-latest-linux/latest/chrome --headless --disable-gpu --remote-debugging-port=9222 --remote-debugging-address=0.0.0.0 --disable-web-security --disable-xss-auditor --no-sandbox --disable-setuid-sandbox
    # python emails.py "restart puppeteer successfully"
fi
