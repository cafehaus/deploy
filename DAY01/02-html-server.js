const http = require('node:http')

const html = `
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
  <head>
    <meta charset="utf-8">
    <title>html-server</title>
  </head>
  <body>
    我是一个 html-server
  </body>
</html>
`
const server = http.createServer((req, res) => {
    console.log(req)
    res.end(html)
})

server.listen(3000, () => {
    console.log('server running port 3000')
})