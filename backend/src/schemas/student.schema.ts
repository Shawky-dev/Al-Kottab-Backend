import { z } from 'zod'

export const studentSchema = z.object({
  email: z.string().email(),
  firstName: z.string().optional(),
  lastName: z.string().optional(),
  ageRange: z.number().optional(),
  gender: z.number().optional(),
  nationality: z.number().optional(),
  phoneNumber: z.number().optional(),
  level: z.number().optional(),
})
