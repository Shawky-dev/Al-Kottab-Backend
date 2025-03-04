import {
  AgeRange,
  Gender,
  getAgeRangeFromIndex,
  getGenderFromIndex,
  getLevelFromIndex,
  getNationalityFromIndex,
  Level,
  Nationality,
} from '../student.type'
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
  // Changed to an array of Qiraah

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
    qiraah = [], // Default to an empty array
  }: {
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
    qiraah?: Qiraah[] // Updated to accept an array
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

  // Convert Teacher object to a Map<string, any> for Firebase
  toFirebaseMap(): Record<string, any> {
    return Object.fromEntries(
      // to encure that there are no undefined values just null
      Object.entries({
        email: this.email,
        rating: this.rating,
        timeSlots:
          this.timeSlots.length > 0
            ? this.timeSlots.map((slot) => slot.toMap())
            : null,
        firstName: this.firstName,
        lastName: this.lastName,
        birthYear: this.birthYear,
        birthMonth: this.birthMonth,
        birthDay: this.birthDay,
        phoneNumber: this.phoneNumber,
        description: this.description,
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
            : null, // Convert empty array to null if needed
      }).map(([key, value]) => [key, value ?? null]) // Replace undefined with null
    )
  }

  // Convert a Map<string, any> to a Teacher object
  static fromFirebaseMap(map: Record<string, any>, uid: string): Teacher {
    return new Teacher({
      email: map.email,
      rating: map.email,
      uid: uid,
      timeSlots: TimeSlot.getTimeSlotsFromIndices(map.timeSlots), // Convert array of indices to array of Qiraah
      firstName: map.firstName,
      lastName: map.lastName,
      birthYear: map.birthYear,
      birthMonth: map.birthMonth,
      birthDay: map.birthDay,
      phoneNumber: map.phoneNumber,
      description: map.description,
      nationality: getNationalityFromIndex(map.nationality),
      gender: getGenderFromIndex(map.gender),
      preferredStudentAgeRange: getAgeRangeFromIndex(
        map.preferredStudentAgeRange
      ),
      preferredStudentLevel: getLevelFromIndex(map.preferredStudentLevel),
      qiraah: getQiraahListFromIndices(map.qiraah),
    })
  }
}

// Convert a list of indices to a list of Qiraah
export function getQiraahListFromIndices(
  indices: number[] | undefined
): Qiraah[] {
  if (!indices) return []
  return indices.map((index) => Object.values(Qiraah)[index] as Qiraah)
}

// Convert a single index to a Qiraah (optional, for backward compatibility)
export function getQiraahFromIndex(
  index: number | undefined
): Qiraah | undefined {
  if (index === undefined) return undefined
  return Object.values(Qiraah)[index] as Qiraah
}
