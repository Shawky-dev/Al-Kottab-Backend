import { Request, Response, NextFunction } from 'express'
import { StatusCodes } from 'http-status-codes'
import db from '../config/firebase.config'
import { Student } from '../types/student'

type studentResponse = {
  message: string
  details?: string | null //err details
  student?: object | null
  studentList?: object[] | null
}

//TODO: need to add permissions for this
const getStudentFromUid = async (req: Request, res: Response) => {
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
      }
      res.status(StatusCodes.NOT_FOUND).json(response)
    } else {
      const response: studentResponse = {
        message: 'Student found',
        details: null,
        student: student.data(),
        studentList: null,
      }
      res.status(StatusCodes.OK).json(response)
    }
  } catch (error: any) {
    logging.error(error)
    const response: studentResponse = {
      message: 'Error occurred',
      details: error,
      student: null,
      studentList: null,
    }
    res.status(StatusCodes.INTERNAL_SERVER_ERROR).json(response)
  }
}

const editStudentProfile = async (req: Request, res: Response) => {
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
      }
      res.status(StatusCodes.NOT_FOUND).json(response)
    } else {
      const data = req.body
      logging.info(data)
      await studentRef.update(data)
      const response: studentResponse = {
        message: 'Student updated',
        details: null,
        student: data,
        studentList: null,
      }
      res.status(StatusCodes.OK).json(response)
    }
  } catch (error: any) {
    logging.error(error)
    const response: studentResponse = {
      message: 'Internal Server Error occurred',
      details: error,
      student: null,
      studentList: null,
    }
    res.status(StatusCodes.INTERNAL_SERVER_ERROR).json(response)
  }
}

export default {
  getStudentFromUid,
  editStudentProfile,
}
