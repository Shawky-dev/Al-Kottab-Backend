export class Reservation {
  uid: string
  teacherUID: string
  studentsUID: string[]
  hour: number
  day: number
  month: number
  year: number
  duration: number // in seconds
  in_progress: boolean

  constructor({
    uid,
    teacherUID,
    studentsUID,
    hour,
    day,
    month,
    year,
    duration,
  }: {
    uid: string
    teacherUID: string
    studentsUID: string[]
    hour: number
    day: number
    month: number
    year: number
    duration: number
  }) {
    this.uid = uid
    this.teacherUID = teacherUID
    this.studentsUID = studentsUID
    this.hour = hour
    this.day = day
    this.month = month
    this.year = year
    this.duration = duration
    this.in_progress = false
  }

  toFirebaseMape(): Record<string, any> {
    return Object.fromEntries(
      Object.entries({
        uid: this.uid,
        teacherUID: this.teacherUID,
        studentsUID: this.studentsUID,
        hour: this.hour,
        day: this.day,
        month: this.month,
        year: this.year,
        duration: this.duration,
        in_progress: this.in_progress,
      }).map(([key, value]) => [key, value ?? null])
    )
  }
}
