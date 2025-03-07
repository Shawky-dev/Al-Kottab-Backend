import { z } from 'zod'
import { AgeRange, Gender, Level, Nationality } from '../../types/student.type'
import { Qiraah } from '../../types/teacher/teacher.type'

export const editProfileTeacherSchema = z.object({
  firstName: z.string(),
  lastName: z.string(),
  birthYear: z.number(),
  birthMonth: z.number(),
  birthDay: z.number(),
  phoneNumber: z.string(),
  description: z.string().max(200),
  nationality: z.number().max(Object.keys(Nationality).length), //gets the length of the possible enums and put them as the max number so that invalid numbers cannot happen
  gender: z.number().max(Object.keys(Gender).length),
  preferredStudentLevel: z.number().max(Object.keys(Level).length),
  preferredStudentAgeRange: z.number().max(Object.keys(AgeRange).length),
  qiraah: z.array(z.number().max(Object.keys(Qiraah).length)),
})

export type RegisterSchema = z.infer<typeof editProfileTeacherSchema>
