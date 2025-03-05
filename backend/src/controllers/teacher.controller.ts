import { Request, Response, NextFunction } from 'express'
import { AuthorizationRequest } from '../types/express'
import { StatusCodes } from 'http-status-codes'
import admin from '../config/firebase.config'
import { DecodedIdToken, getAuth } from 'firebase-admin/auth'
import { Teacher } from '../types/teacher/teacher.type'
import { registerSchema, RegisterSchema } from '../schemas/register.schema'
import { auth } from 'firebase-admin'
import {
  selectTimeSLot,
  selectTimeSlotTeacherSchema,
} from '../schemas/teacher/selectTimeSlot.teacher.schema'
import { string } from 'zod'
import { TimeSlot } from '../types/teacher/timeSlot.type'

export type teacherResponse = {
  message: string
  details?: string | null
  teacher?: object | null
  teacherList?: object[] | null
  customToken?: string | null
}

const getTeacherFromUid = async (req: AuthorizationRequest, res: Response) => {
  try {
    const { uid } = req.params
    const teacherRef = admin.firestore().collection('teachers').doc(uid)
    const teacher = await teacherRef.get()

    if (!teacher.exists) {
      const response: teacherResponse = {
        message: 'Teacher not found',
        details: null,
        teacher: null,
        teacherList: null,
        customToken: null,
      }
      res.status(StatusCodes.NOT_FOUND).json(response)
      return
    } else {
      const response: teacherResponse = {
        message: 'Teacher found',
        details: null,
        teacher: teacher.data(),
        teacherList: null,
        customToken: null,
      }
      res.status(StatusCodes.OK).json(response)
      return
    }
  } catch (error: any) {
    logging.error(error)
    const response: teacherResponse = {
      message: 'Error occurred',
      details: error,
      teacher: null,
      teacherList: null,
      customToken: null,
    }
    res.status(StatusCodes.INTERNAL_SERVER_ERROR).json(response)
    return
  }
}

const editTeacherProfile = async (req: AuthorizationRequest, res: Response) => {
  try {
    const uid: string = req.user?.uid as string
    const teacherRef = admin.firestore().collection('teachers').doc(uid)
    const teacher = await teacherRef.get()
    if (!teacher.exists) {
      const response: teacherResponse = {
        message: 'Teacher not found',
        details: null,
        teacher: null,
        teacherList: null,
        customToken: null,
      }
      res.status(StatusCodes.NOT_FOUND).json(response)
      return
    } else {
      const data = req.body
      logging.info(data)
      await teacherRef.update(data)
      const response: teacherResponse = {
        message: 'Teacher updated',
        details: null,
        teacher: data,
        teacherList: null,
        customToken: null,
      }
      res.status(StatusCodes.OK).json(response)
      return
    }
  } catch (error: any) {
    logging.error(error)
    const response: teacherResponse = {
      message: 'Internal Server Error occurred',
      details: error,
      teacher: null,
      teacherList: null,
      customToken: null,
    }
    res.status(StatusCodes.INTERNAL_SERVER_ERROR).json(response)
    return
  }
}

const getCurrentTeacher = async (req: AuthorizationRequest, res: Response) => {
  try {
    const uid: string = req.user?.uid as string
    const teacherRef = admin.firestore().collection('teachers').doc(uid)
    const teacher = await teacherRef.get()

    if (!teacher.exists) {
      const response: teacherResponse = {
        message: 'Teacher not found',
        details: null,
        teacher: null,
        teacherList: null,
        customToken: null,
      }
      res.status(StatusCodes.NOT_FOUND).json(response)
    } else {
      const response: teacherResponse = {
        message: 'Teacher found',
        details: null,
        teacher: teacher.data(),
        teacherList: null,
        customToken: null,
      }
      res.status(StatusCodes.OK).json(response)
      return
    }
  } catch (error: any) {
    logging.error(error)
    const response: teacherResponse = {
      message: 'Error occurred',
      details: error,
      teacher: null,
      teacherList: null,
      customToken: null,
    }
    res.status(StatusCodes.INTERNAL_SERVER_ERROR).json(response)
    return
  }
}

const getAllTeachers = async (req: AuthorizationRequest, res: Response) => {
  try {
    const teachersRef = admin.firestore().collection('teachers')
    const snapshot = await teachersRef.get()
    const teachers: Teacher[] = []
    snapshot.forEach((doc) => {
      teachers.push(Teacher.fromFirebaseMap(doc.data(), doc.id))
      logging.log(typeof doc.data())
    })
    const response: teacherResponse = {
      message: 'Teachers retrieved successfully',
      details: null,
      teacher: null,
      teacherList: teachers,
    }

    res.status(StatusCodes.OK).json(response)
    return
  } catch (error: any) {
    logging.error(error)
    const response: teacherResponse = {
      message: 'Error occurred',
      details: error,
      teacher: null,
      teacherList: null,
      customToken: null,
    }
    res.status(StatusCodes.INTERNAL_SERVER_ERROR).json(response)
    return
  }
}

const registerTeacher = async (req: Request, res: Response) => {
  let userRecord: admin.auth.UserRecord | null = null

  try {
    const parsedBody: RegisterSchema = registerSchema.parse(req.body)

    // Check if teacher already exists
    const teacherRef = admin
      .firestore()
      .collection('teachers')
      .where('email', '==', parsedBody.email)
    const teacherSnapshot = await teacherRef.get()
    if (!teacherSnapshot.empty) {
      res.status(StatusCodes.CONFLICT).json({
        message: 'User already exists',
        details: null,
        teacher: null,
        teacherList: null,
        customToken: null,
      })
      return
    }

    // Check if student already exists
    const studentRef = admin
      .firestore()
      .collection('students')
      .where('email', '==', parsedBody.email)
    const studentSnapshot = await studentRef.get()
    if (!studentSnapshot.empty) {
      res.status(StatusCodes.CONFLICT).json({
        message: 'User already exists',
        details: null,
        teacher: null,
        teacherList: null,
        customToken: null,
      })
      return
    }

    // Create a new user in Firebase Auth
    userRecord = await admin.auth().createUser({
      email: parsedBody.email,
      password: parsedBody.password,
    })

    // Create a new teacher entry
    const teacher = new Teacher({
      email: userRecord.email as string,
      uid: userRecord.uid,
      //other essential attributes below
      rating: 0,
      timeSlots: [],
    })

    const teacherData = teacher.toFirebaseMap()
    await admin
      .firestore()
      .collection('teachers')
      .doc(userRecord.uid)
      .set(teacherData)

    // Generate custom auth token
    const customToken = await auth().createCustomToken(userRecord.uid)

    res.status(StatusCodes.CREATED).json({
      message: 'Created Account Successfully',
      details: null,
      teacher: teacherData,
      teacherList: null,
      customToken,
    })
    return
  } catch (error: any) {
    logging.error(error)

    if (userRecord) {
      try {
        await admin.auth().deleteUser(userRecord.uid)
        await admin
          .firestore()
          .collection('teachers')
          .doc(userRecord.uid)
          .delete()
      } catch (cleanupError) {
        logging.error('Cleanup error:', cleanupError)
      }
    }

    res.status(StatusCodes.INTERNAL_SERVER_ERROR).json({
      message: 'Error occurred',
      details: error,
      teacher: null,
      teacherList: null,
      customToken: null,
    })
    return
  }
}
const selectTimeSlot = async (req: AuthorizationRequest, res: Response) => {
  try {
    const parsedBody: selectTimeSLot = selectTimeSlotTeacherSchema.parse(
      req.body
    )
    const uid: string = req.user?.uid as string
    const teacherRef = admin.firestore().collection('teachers').doc(uid)
    const teacherDoc = await teacherRef.get()
    if (!teacherDoc.exists) {
      const response: teacherResponse = {
        message: 'Teacher not found',
        details: null,
        teacher: null,
        teacherList: null,
        customToken: null,
      }
      res.status(StatusCodes.NOT_FOUND).json(response)
    } else {
      const teacherData = teacherDoc.data()
      if (teacherData) {
        const teacher = Teacher.fromFirebaseMap(teacherData, teacherDoc.id)
        const newTimeSlot = new TimeSlot(parsedBody)

        const conflictedTimeSlot: TimeSlot | null = Teacher.addNewTimeSlot(
          newTimeSlot,
          teacher.timeSlots
        )
        if (conflictedTimeSlot == null) {
          const response: teacherResponse = {
            message: 'added new time slot to teacher',
            details: null,
            teacher: teacher,
            teacherList: null,
            customToken: null,
          }
          res.status(StatusCodes.OK).json(response)
        } else {
          const response: teacherResponse = {
            message: 'Conflicts with existing TimeSlot',
            details: conflictedTimeSlot.toMap() as any,
            teacher: null,
            teacherList: null,
            customToken: null,
          }
          res.status(StatusCodes.CONFLICT).json(response)
        }
      }
    }
  } catch (error: any) {
    logging.error(error)
    const response: teacherResponse = {
      message: 'Error occurred',
      details: error,
      teacher: null,
      teacherList: null,
      customToken: null,
    }
    res.status(StatusCodes.INTERNAL_SERVER_ERROR).json(response)
    return
  }
}
export default {
  getTeacherFromUid,
  editTeacherProfile,
  getCurrentTeacher,
  getAllTeachers,
  registerTeacher,
  selectTimeSlot,
}
