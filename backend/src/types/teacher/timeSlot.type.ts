export enum DayOfWeek {
  Sunday,
  Monday,
  Tuesday,
  Wednesday,
  Thursday,
  Friday,
  Saturday,
}

export class TimeSlot {
  day: DayOfWeek
  hourRangeA: string //9:00 -> 10:00  (9:00 is rangeA, 10:00 is range B)
  hourRangeB: string

  constructor({
    day,
    hourRangeA,
    hourRangeB,
  }: {
    day: DayOfWeek
    hourRangeA: string
    hourRangeB: string
  }) {
    this.day = day
    this.hourRangeA = hourRangeA
    this.hourRangeB = hourRangeB
  }

  toMap(): Record<string, any> {
    return {
      day: this.day,
      hourRangeA: this.hourRangeA,
      hourRangeB: this.hourRangeB,
    }
  }
  static getTimeSlotsFromIndices(slots: Record<string, any>[]): TimeSlot[] {
    return slots.map(
      (slot) =>
        new TimeSlot({
          day: slot.day,
          hourRangeA: slot.hourRangeA,
          hourRangeB: slot.hourRangeB,
        })
    )
  }

  static doTimeSlotsConflict(slot1: TimeSlot, slot2: TimeSlot): boolean {
    if (slot1.day !== slot2.day) {
      return false
    }

    const parseTime = (time: string): Date => {
      const [hours, minutes, seconds] = time.split(':').map(Number)
      return new Date(1970, 0, 1, hours, minutes, seconds || 0)
    }

    const [start1, end1] = [slot1.hourRangeA, slot1.hourRangeB].map(parseTime)
    const [start2, end2] = [slot2.hourRangeA, slot2.hourRangeB].map(parseTime)

    return start1 < end2 && start2 < end1
  }
}
