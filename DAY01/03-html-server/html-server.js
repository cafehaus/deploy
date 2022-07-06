const http = require('node:http')
const path = require('node:path')
const fs = require('node:fs')
// const html = fs.readFileSync('./index.html')
const html = fs.readFileSync(path.join(__dirname,'index.html'))

const server = http.createServer((req, res) => {
    console.log(req)
    res.end(html)
})

server.listen(3000, () => {
    console.log('server running port 3000')
})