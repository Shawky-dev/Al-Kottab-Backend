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

  // Convert Student object to a Record<string, any> for Firebase
  toFirebaseMap(): Record<string, any> {
    return {
      email: this.email,
      firstName: this.firstName ?? null,
      lastName: this.lastName ?? null,
      ageRange: this.ageRange
        ? Object.values(AgeRange).indexOf(this.ageRange)
        : null,
      gender: this.gender ? Object.values(Gender).indexOf(this.gender) : null,
      nationality: this.nationality
        ? Object.values(Nationality).indexOf(this.nationality)
        : null,
      phoneNumber: this.phoneNumber ?? null,
      level: this.level ? Object.values(Level).indexOf(this.level) : null,
    }
  }

  // Convert a Record<string, any> to a Student object
  static fromFirebaseMap(map: Record<string, any>, uid: string): Student {
    return new Student({
      email: map.email,
      uid: uid,
      password: map.password,
      firstName: map.firstName,
      lastName: map.lastName,
      ageRange:
        map.ageRange !== null
          ? Object.values(AgeRange)[map.ageRange]
          : undefined,
      gender:
        map.gender !== null ? Object.values(Gender)[map.gender] : undefined,
      nationality:
        map.nationality !== null
          ? Object.values(Nationality)[map.nationality]
          : undefined,
      phoneNumber: map.phoneNumber,
      level: map.level !== null ? Object.values(Level)[map.level] : undefined,
    })
  }
}
