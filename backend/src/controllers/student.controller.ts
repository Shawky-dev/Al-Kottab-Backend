import { Request, Response, NextFunction } from 'express'
import { StatusCodes } from 'http-status-codes'
import db from '../config/firebase.config'
//TODO: need to add permissions for this
const getStudentFromUUID = async (req: Request, res: Response) => {
  try {
    const { uuid } = req.params
    const studentRef = db.firestore().collection('students').doc(uuid)
    const student = await studentRef.get()
    if (!student.exists) {
      res.status(StatusCodes.NOT_FOUND).json({ message: 'Student not found' })
    } else {
      res.status(StatusCodes.OK).json(student.data())
    }
  } catch (error: any) {
    logging.error(error)
    res.status(StatusCodes.INTERNAL_SERVER_ERROR).json({ error: error })
  }
}

const editStudentProfile = async (req: Request, res: Response) => {
  try {
  } catch (error: any) {
    logging.error(error)
    res.status(StatusCodes.INTERNAL_SERVER_ERROR).json({ error: error })
  }
}

export default {
  getStudentFromUUID,
  editStudentProfile,
}
