import { z } from 'zod'
import { Gender, Level, Nationality } from '../../types/student.type'

export const editProfileStudentSchema = z.object({
  firstName: z.string(),
  lastName: z.string(),
  phoneNumber: z.string(),
  ageRange: z.number(),
  gender: z.number().max(Object.keys(Gender).length), //gets the length of the possible enums and put them as the max number so that invalid numbers cannot happen
  nationality: z.number().max(Object.keys(Nationality).length),
  level: z.number().max(Object.keys(Level).length),
})

export type RegisterSchema = z.infer<typeof editProfileStudentSchema>
