import 'dotenv/config'
import express from 'express'
import cors from 'cors'
import https from 'https'
import http from 'http'
import { Request, Response } from 'express'
import siteRoutes from './routes/site'
import { requestIntercepter } from './utils/requestIntercepter'

const app = express()

app.use(cors())
app.use(express.json())
app.use(express.urlencoded({ extended: true }))

app.all('*', requestIntercepter)

//app.use('/adimin', adminRoutes)
app.use('/', siteRoutes)
app.use((req: Request, res: Response) => {
    res.status(404).json({ error: '🙁 404 error not found'})
})

const runServer = (port: number, server: http.Server) => {
    server.listen(port, () => {
        console.log(`🚀 Running at PORT ${port}`)
    })
}

const regularServer = http.createServer(app)
if(process.env.NODE_ENV === 'production'){
    // TODO: configurar SSL
    // TODO: rodar server na 80 e na 443
} else {
    const serverPort: number = process.env.PORT ? parseInt(process.env.PORT) : 9000
    runServer(serverPort, regularServer)
}