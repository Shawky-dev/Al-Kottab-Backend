import { z } from 'zod'
import { DayOfWeek } from '../../types/teacher/timeSlot.type'

export const selectTimeSlotTeacherSchema = z.object({
  day: z.number().max(Object.keys(DayOfWeek).length),
  hourRangeA: z.string().time(),
  hourRangeB: z.string().time(),
})

export type selectTimeSLot = z.infer<typeof selectTimeSlotTeacherSchema>
