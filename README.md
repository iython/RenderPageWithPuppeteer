# 一键部署你的 js 渲染服务  

## 开发环境  
- Mac / Linux
- Docker version 18 
- Python3.6  

## 构建镜像  
- docker build -t <image_tag> .  

## 启动镜像  
- docker run -d -p 9222:9222 <image_id> /home/xyz/puppeteer/chromium-latest-linux/latest/chrome --headless --disable-gpu --remote-debugging-port=9222 --remote-debugging-address=0.0.0.0 --disable-web-security --disable-xss-auditor --no-sandbox --disable-setuid-sandbox 
- 如果想加代理：--proxy-server=xxx.xxx.xxx.xxx:1234 
 

## 使用，修改代码中第12行的地址为本地地址
- python3.6 demo.py https://www.baidu.com

## 缺点
- 代理只能在启动Docker时传递，即启动浏览器这个层面添加，不能每访问一个页面（tab）设置一个。（存疑？）
- 可参考https://github.com/GoogleChrome/puppeteer/issues/678、https://hackernoon.com/tips-and-tricks-for-web-scraping-with-puppeteer-ed391a63d952

## 参考
- 猪哥

