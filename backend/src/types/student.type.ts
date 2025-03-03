export enum Level {
  beginner = 'beginner',
  intermediate = 'intermediate',
  advanced = 'advanced',
}

export enum AgeRange {
  age13_17 = '13-17',
  age18_25 = '18-25',
  age26_35 = '26-35',
  age36_45 = '36-45',
  age46_55 = '46-55',
  age56_65 = '56-65',
  age66Plus = '66+',
}

export enum Nationality {
  A = 'A',
  B = 'B',
  C = 'C',
  D = 'D',
}

export enum Gender {
  male = 'male',
  female = 'female',
}

export class Student {
  email: string
  uid: string
  password?: string
  firstName?: string
  lastName?: string
  ageRange?: AgeRange
  gender?: Gender
  nationality?: Nationality
  phoneNumber?: string
  level?: Level

  constructor({
    email,
    uid,
    password,
    firstName,
    lastName,
    ageRange,
    gender,
    nationality,
    phoneNumber,
    level,
  }: {
    email: string
    uid: string
    password?: string
    firstName?: string
    lastName?: string
    ageRange?: AgeRange
    gender?: Gender
    nationality?: Nationality
    phoneNumber?: string
    level?: Level
  }) {
    this.email = email
    this.uid = uid
    this.password = password
    this.firstName = firstName
    this.lastName = lastName
    this.ageRange = ageRange
    this.gender = gender
    this.nationality = nationality
    this.phoneNumber = phoneNumber
    this.level = level
  }

  // Convert Student object to a Map<string, any> for Firebase
  toFirebaseMap(): Record<string, any> {
    return Object.fromEntries(
      Object.entries({
        email: this.email,
        firstName: this.firstName,
        lastName: this.lastName,
        ageRange: this.ageRange
          ? Object.values(AgeRange).indexOf(this.ageRange)
          : undefined,
        gender: this.gender
          ? Object.values(Gender).indexOf(this.gender)
          : undefined,
        nationality: this.nationality
          ? Object.values(Nationality).indexOf(this.nationality)
          : undefined,
        phoneNumber: this.phoneNumber,
        level: this.level
          ? Object.values(Level).indexOf(this.level)
          : undefined,
      }).map(([key, value]) => [key, value ?? null]) // Replace undefined with null
    )
  }

  // Convert a Map<string, any> to a Student object
  static fromFirebaseMap(map: Record<string, any>, uid: string): Student {
    return new Student({
      email: map.email,
      uid: uid,
      password: map.password,
      firstName: map.firstName,
      lastName: map.lastName,
      ageRange: getAgeRangeFromIndex(map.ageRange),
      gender: getGenderFromIndex(map.gender),
      nationality: getNationalityFromIndex(map.nationality),
      phoneNumber: map.phoneNumber,
      level: getLevelFromIndex(map.level),
    })
  }
}

// Helper functions to get enum values from index
export function getAgeRangeFromIndex(
  index: number | undefined
): AgeRange | undefined {
  if (index === undefined) return undefined
  return Object.values(AgeRange)[index] as AgeRange
}

export function getGenderFromIndex(
  index: number | undefined
): Gender | undefined {
  if (index === undefined) return undefined
  return Object.values(Gender)[index] as Gender
}

export function getNationalityFromIndex(
  index: number | undefined
): Nationality | undefined {
  if (index === undefined) return undefined
  return Object.values(Nationality)[index] as Nationality
}

export function getLevelFromIndex(
  index: number | undefined
): Level | undefined {
  if (index === undefined) return undefined
  return Object.values(Level)[index] as Level
}
