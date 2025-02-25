import { Response, NextFunction } from 'express'
import { AuthorizationRequest } from '../types/express'
import { StatusCodes } from 'http-status-codes'
import db from '../config/firebase.config'
import { DecodedIdToken } from 'firebase-admin/auth'
import { Teacher } from '../types/teacher.type'

type teacherResponse = {
  message: string
  details?: string | null
  teacher?: object | null
  teacherList?: object[] | null
}

const getTeacherFromUid = async (req: AuthorizationRequest, res: Response) => {
  try {
    const { uid } = req.params
    const teacherRef = db.firestore().collection('teachers').doc(uid)
    const teacher = await teacherRef.get()

    if (!teacher.exists) {
      const response: teacherResponse = {
        message: 'Teacher not found',
        details: null,
        teacher: null,
        teacherList: null,
      }
      res.status(StatusCodes.NOT_FOUND).json(response)
    } else {
      const response: teacherResponse = {
        message: 'Teacher found',
        details: null,
        teacher: teacher.data(),
        teacherList: null,
      }
      res.status(StatusCodes.OK).json(response)
    }
  } catch (error: any) {
    logging.error(error)
    const response: teacherResponse = {
      message: 'Error occurred',
      details: error,
      teacher: null,
      teacherList: null,
    }
    res.status(StatusCodes.INTERNAL_SERVER_ERROR).json(response)
  }
}

const editTeacherProfile = async (req: AuthorizationRequest, res: Response) => {
  try {
    const uid: string = req.user?.uid as string
    const teacherRef = db.firestore().collection('teachers').doc(uid)
    const teacher = await teacherRef.get()
    if (!teacher.exists) {
      const response: teacherResponse = {
        message: 'Teacher not found',
        details: null,
        teacher: null,
        teacherList: null,
      }
      res.status(StatusCodes.NOT_FOUND).json(response)
    } else {
      const data = req.body
      logging.info(data)
      await teacherRef.update(data)
      const response: teacherResponse = {
        message: 'Teacher updated',
        details: null,
        teacher: data,
        teacherList: null,
      }
      res.status(StatusCodes.OK).json(response)
    }
  } catch (error: any) {
    logging.error(error)
    const response: teacherResponse = {
      message: 'Internal Server Error occurred',
      details: error,
      teacher: null,
      teacherList: null,
    }
    res.status(StatusCodes.INTERNAL_SERVER_ERROR).json(response)
  }
}

const getCurrentTeacher = async (req: AuthorizationRequest, res: Response) => {
  try {
    const uid: string = req.user?.uid as string
    const teacherRef = db.firestore().collection('teachers').doc(uid)
    const teacher = await teacherRef.get()

    if (!teacher.exists) {
      const response: teacherResponse = {
        message: 'Teacher not found',
        details: null,
        teacher: null,
        teacherList: null,
      }
      res.status(StatusCodes.NOT_FOUND).json(response)
    } else {
      const response: teacherResponse = {
        message: 'Teacher found',
        details: null,
        teacher: teacher.data(),
        teacherList: null,
      }
      res.status(StatusCodes.OK).json(response)
    }
  } catch (error: any) {
    logging.error(error)
    const response: teacherResponse = {
      message: 'Error occurred',
      details: error,
      teacher: null,
      teacherList: null,
    }
    res.status(StatusCodes.INTERNAL_SERVER_ERROR).json(response)
  }
}

export default {
  getTeacherFromUid,
  editTeacherProfile,
  getCurrentTeacher,
}
