const http = require('node:http')

const server = http.createServer((req, res) => {
    console.log(req)
    res.end('Hello, world!')
})

server.listen(3000, () => {
    console.log('server running port 3000')
})