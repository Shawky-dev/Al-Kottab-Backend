import { z } from 'zod'

export const userRegstrationSchema = z.object({
  username: z.string(),
  email: z.string().email(),
  password: z.string().min(8),
})
