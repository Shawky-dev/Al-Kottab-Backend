import { teacherResponse } from '../../controllers/teacher.controller'
import { AgeRange, Gender, Level, Nationality } from '../student.type'
import { TimeSlot } from './timeSlot.type'

export enum Qiraah {
  Qiraah1,
  Qiraah2,
  Qiraah4,
  Qiraah5,
}

export class Teacher {
  email: string
  uid: string
  rating: number
  timeSlots: TimeSlot[]
  firstName?: string
  lastName?: string
  birthYear?: string
  birthMonth?: string
  birthDay?: string
  phoneNumber?: string
  description?: string
  nationality?: Nationality
  gender?: Gender
  preferredStudentAgeRange?: AgeRange
  preferredStudentLevel?: Level
  qiraah: Qiraah[]

  constructor({
    email,
    uid,
    rating,
    timeSlots = [],
    firstName,
    lastName,
    birthYear,
    birthMonth,
    birthDay,
    phoneNumber,
    description,
    nationality,
    gender,
    preferredStudentAgeRange,
    preferredStudentLevel,
    qiraah = [],
  }: {
    email: string
    uid: string
    rating: number
    timeSlots?: TimeSlot[]
    firstName?: string
    lastName?: string
    birthYear?: string
    birthMonth?: string
    birthDay?: string
    phoneNumber?: string
    description?: string
    nationality?: Nationality
    gender?: Gender
    preferredStudentAgeRange?: AgeRange
    preferredStudentLevel?: Level
    qiraah?: Qiraah[]
  }) {
    this.email = email
    this.uid = uid
    this.rating = rating
    this.timeSlots = timeSlots
    this.firstName = firstName
    this.lastName = lastName
    this.birthYear = birthYear
    this.birthMonth = birthMonth
    this.birthDay = birthDay
    this.phoneNumber = phoneNumber
    this.description = description
    this.nationality = nationality
    this.gender = gender
    this.preferredStudentAgeRange = preferredStudentAgeRange
    this.preferredStudentLevel = preferredStudentLevel
    this.qiraah = qiraah
  }

  // Convert Teacher object to a Record<string, any> for Firebase
  toFirebaseMap(): Record<string, any> {
    return {
      email: this.email,
      rating: this.rating,
      timeSlots:
        this.timeSlots.length > 0
          ? this.timeSlots.map((slot) => slot.toMap())
          : null,
      firstName: this.firstName ?? null,
      lastName: this.lastName ?? null,
      birthYear: this.birthYear ?? null,
      birthMonth: this.birthMonth ?? null,
      birthDay: this.birthDay ?? null,
      phoneNumber: this.phoneNumber ?? null,
      description: this.description ?? null,
      nationality:
        this.nationality !== undefined
          ? Object.values(Nationality).indexOf(this.nationality)
          : null,
      gender:
        this.gender !== undefined
          ? Object.values(Gender).indexOf(this.gender)
          : null,
      preferredStudentAgeRange:
        this.preferredStudentAgeRange !== undefined
          ? Object.values(AgeRange).indexOf(this.preferredStudentAgeRange)
          : null,
      preferredStudentLevel:
        this.preferredStudentLevel !== undefined
          ? Object.values(Level).indexOf(this.preferredStudentLevel)
          : null,
      qiraah:
        this.qiraah.length > 0
          ? this.qiraah.map((q) => Object.values(Qiraah).indexOf(q))
          : null,
    }
  }

  // Convert a Record<string, any> to a Teacher object
  static fromFirebaseMap(map: Record<string, any>, uid: string): Teacher {
    return new Teacher({
      email: map.email,
      rating: map.rating,
      uid: uid,
      timeSlots: map.timeSlots
        ? TimeSlot.getTimeSlotsFromIndices(map.timeSlots)
        : [],
      firstName: map.firstName,
      lastName: map.lastName,
      birthYear: map.birthYear,
      birthMonth: map.birthMonth,
      birthDay: map.birthDay,
      phoneNumber: map.phoneNumber,
      description: map.description,
      nationality:
        map.nationality !== null
          ? Object.values(Nationality)[map.nationality]
          : undefined,
      gender:
        map.gender !== null ? Object.values(Gender)[map.gender] : undefined,
      preferredStudentAgeRange:
        map.preferredStudentAgeRange !== null
          ? Object.values(AgeRange)[map.preferredStudentAgeRange]
          : undefined,
      preferredStudentLevel:
        map.preferredStudentLevel !== null
          ? Object.values(Level)[map.preferredStudentLevel]
          : undefined,
      qiraah: map.qiraah
        ? map.qiraah.map((index: number) => Object.values(Qiraah)[index])
        : [],
    })
  }

  // Add a new time slot if it doesn't conflict with existing ones
  static addNewTimeSlot(
    newTimeSlot: TimeSlot,
    timeSlots: TimeSlot[]
  ): TimeSlot | null {
    const existingTimeSlotDays = timeSlots.filter(
      (ts) => ts.day === newTimeSlot.day
    )

    for (const existingSlot of existingTimeSlotDays) {
      if (TimeSlot.doTimeSlotsConflict(existingSlot, newTimeSlot)) {
        return existingSlot // Return the conflicting time slot
      }
    }

    return null // No conflict
  }
}

// Convert a list of indices to a list of Qiraah
export function getQiraahListFromIndices(
  indices: number[] | undefined
): Qiraah[] {
  if (!indices) return []
  return indices.map((index) => Object.values(Qiraah)[index] as Qiraah)
}
