import { z } from 'zod'

export const teacherSchema = z.object({
  email: z.string().email(),
  firstName: z.string().optional(),
  lastName: z.string().optional(),
  birthYear: z.number().optional(),
  birthMonth: z.string().optional(),
  birthDay: z.string().optional(),
  phoneNumber: z.string().optional(),
  description: z.string().optional(),
  nationality: z.number().optional(),
  gender: z.number().optional(),
  preferredStudentAgeRange: z.number().optional(),
  preferredStudentLevel: z.number().optional(),
})
