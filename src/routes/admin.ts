import { Router } from "express"
import { Request, Response } from "express"
import * as auth from '../controllers/auth'

const router = Router()

router.post('/login', auth.login)

router.get('/ping', auth.validate, (req: Request, res: Response) => {
    res.status(200).json({ pong: true, admin: true })
})

export default router