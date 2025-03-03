import { z } from 'zod'

export const registerSchema = z.object({
  email: z.string().email(),
  password: z.string(), //TODO: add validation for password
})

export type RegisterSchema = z.infer<typeof registerSchema>
