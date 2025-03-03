import { Response, NextFunction, Request } from 'express'
import { AuthorizationRequest } from '../types/express'
import { StatusCodes } from 'http-status-codes'
import db from '../config/firebase.config'
import { Student } from '../types/student.type'
import { DecodedIdToken } from 'firebase-admin/auth'
import admin from '../config/firebase.config'
import { registerSchema, RegisterSchema } from '../schemas/register.schema'
import { auth } from 'firebase-admin'

type studentResponse = {
  message: string
  details?: string | null //err details
  student?: object | null
  studentList?: object[] | null
  customToken?: string | null
}

//TODO: need to add permissions for this
const getStudentFromUid = async (req: AuthorizationRequest, res: Response) => {
  try {
    const { uid } = req.params
    const studentRef = db.firestore().collection('students').doc(uid)
    const student = await studentRef.get()

    if (!student.exists) {
      const response: studentResponse = {
        message: 'Student not found',
        details: null,
        student: null,
        studentList: null,
        customToken: null,
      }
      res.status(StatusCodes.NOT_FOUND).json(response)
      return
    } else {
      const response: studentResponse = {
        message: 'Student found',
        details: null,
        student: student.data(),
        studentList: null,
        customToken: null,
      }
      res.status(StatusCodes.OK).json(response)
      return
    }
  } catch (error: any) {
    logging.error(error)
    const response: studentResponse = {
      message: 'Error occurred',
      details: error,
      student: null,
      studentList: null,
      customToken: null,
    }
    res.status(StatusCodes.INTERNAL_SERVER_ERROR).json(response)
    return
  }
}

const editStudentProfile = async (req: AuthorizationRequest, res: Response) => {
  try {
    const uid: string = req.user?.uid as string
    console.log(req.user?.uid)
    const studentRef = db.firestore().collection('students').doc(uid)
    const student = await studentRef.get()
    if (!student.exists) {
      const response: studentResponse = {
        message: 'Student not found',
        details: null,
        student: null,
        studentList: null,
        customToken: null,
      }
      res.status(StatusCodes.NOT_FOUND).json(response)
      return
    } else {
      const data = req.body
      logging.info(data)
      await studentRef.update(data)
      const response: studentResponse = {
        message: 'Student updated',
        details: null,
        student: data,
        studentList: null,
        customToken: null,
      }
      res.status(StatusCodes.OK).json(response)
      return
    }
  } catch (error: any) {
    logging.error(error)
    const response: studentResponse = {
      message: 'Internal Server Error occurred',
      details: error,
      student: null,
      studentList: null,
      customToken: null,
    }
    res.status(StatusCodes.INTERNAL_SERVER_ERROR).json(response)
    return
  }
}

const getCurrentStudent = async (req: AuthorizationRequest, res: Response) => {
  try {
    const uid: string = req.user?.uid as string
    const studentRef = db.firestore().collection('students').doc(uid)
    const student = await studentRef.get()

    if (!student.exists) {
      const response: studentResponse = {
        message: 'Student not found',
        details: null,
        student: null,
        studentList: null,
        customToken: null,
      }
      res.status(StatusCodes.NOT_FOUND).json(response)
      return
    } else {
      const response: studentResponse = {
        message: 'Student found',
        details: null,
        student: student.data(),
        studentList: null,
        customToken: null,
      }
      res.status(StatusCodes.OK).json(response)
      return
    }
  } catch (error: any) {
    logging.error(error)
    const response: studentResponse = {
      message: 'Error occurred',
      details: error,
      student: null,
      studentList: null,
      customToken: null,
    }
    res.status(StatusCodes.INTERNAL_SERVER_ERROR).json(response)
    return
  }
}

const registerStudent = async (req: Request, res: Response) => {
  let userRecord: admin.auth.UserRecord | null = null
  try {
    const parsedBody: RegisterSchema = registerSchema.parse(req.body)

    // Check if student already exists
    const studentRef = admin
      .firestore()
      .collection('students')
      .where('email', '==', parsedBody.email)
    const studentSnapshot = await studentRef.get()
    if (!studentSnapshot.empty) {
      const response: studentResponse = {
        message: 'User already exists',
        details: null,
        student: null,
        studentList: null,
        customToken: null,
      }
      res.status(StatusCodes.CONFLICT).json(response)
      return
    }
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

    // Create a new user in Firebase Auth
    userRecord = await admin.auth().createUser({
      email: parsedBody.email,
      password: parsedBody.password,
    })

    const student = new Student({
      email: userRecord.email as string,
      uid: userRecord.uid,
      //other essential attributes below
    })

    const studentData = student.toFirebaseMap()
    await admin
      .firestore()
      .collection('students')
      .doc(userRecord.uid)
      .set(studentData)

    const customToken = await auth().createCustomToken(userRecord.uid)

    const response: studentResponse = {
      message: 'Created Account Successfully',
      details: null,
      student: null,
      studentList: null,
      customToken,
    }
    res.status(StatusCodes.CREATED).json(response)
    return
  } catch (error: any) {
    logging.error(error)

    if (userRecord) {
      try {
        await admin.auth().deleteUser(userRecord.uid)
        await admin
          .firestore()
          .collection('students')
          .doc(userRecord.uid)
          .delete()
      } catch (cleanupError) {
        logging.error('Cleanup error:', cleanupError)
      }
    }
    const response: studentResponse = {
      message: 'Error occurred',
      details: error,
      student: null,
      studentList: null,
      customToken: null,
    }
    res.status(StatusCodes.INTERNAL_SERVER_ERROR).json(response)
    return
  }
}

export default {
  getStudentFromUid,
  editStudentProfile,
  getCurrentStudent,
  registerStudent,
}
