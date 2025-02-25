import {
  AgeRange,
  Gender,
  getAgeRangeFromIndex,
  getGenderFromIndex,
  getLevelFromIndex,
  getNationalityFromIndex,
  Level,
  Nationality,
} from './student.type'

export class Teacher {
  email: string

  uid: string
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

  constructor({
    email,
    uid,
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
  }: {
    email: string
    uid: string
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
  }) {
    this.email = email
    this.uid = uid
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
  }

  // Convert Teacher object to a Map<string, any> for Firebase
  toFirebaseMap(): Record<string, any> {
    return {
      email: this.email,
      firstName: this.firstName,
      lastName: this.lastName,
      birthYear: this.birthYear,
      birthMonth: this.birthMonth,
      birthDay: this.birthDay,
      phoneNumber: this.phoneNumber,
      description: this.description,
      nationality: this.nationality
        ? Object.values(Nationality).indexOf(this.nationality)
        : undefined,
      gender: this.gender
        ? Object.values(Gender).indexOf(this.gender)
        : undefined,
      preferredStudentAgeRange: this.preferredStudentAgeRange
        ? Object.values(AgeRange).indexOf(this.preferredStudentAgeRange)
        : undefined,
      preferredStudentLevel: this.preferredStudentLevel
        ? Object.values(Level).indexOf(this.preferredStudentLevel)
        : undefined,
    }
  }

  // Convert a Map<string, any> to a Teacher object
  static fromFirebaseMap(map: Record<string, any>, uid: string): Teacher {
    return new Teacher({
      email: map.email,
      uid: uid,
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
    })
  }
}
