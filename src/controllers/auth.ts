import { RequestHandler } from "express"
import { z } from "zod"

export const login: RequestHandler = (req, res) => {
    const loginSchema = z.object({
        password: z.string()
    })
    // body recebe o conteudo da requisição validado pelo loginSchema com zod
    const body = loginSchema.safeParse(req.body)
    if(!body.success) return res.json({ error: "Dados inválidos" })

    // Validar a senha e gerar o token

    // Retorno da requisição

    res.json({ data: body.data.password })
}
