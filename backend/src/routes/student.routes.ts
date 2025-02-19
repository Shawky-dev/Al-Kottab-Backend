import express, { Request, Response, Router } from 'express'
import { validateData } from '../middleware/validateData'
import studentController from '../controllers/student.controller'
import { studentSchema } from '../schemas/student.schema'
import { verifyToken } from '../middleware/verifyToken'

const router: Router = express.Router()

router.get('/getStudent/:uid', studentController.getStudentFromUid)

router.put(
  '/editStudent/:uid',
  validateData(studentSchema),
  studentController.editStudentProfile
)

router.get(
  '/getCurrentStudent',
  verifyToken,
  studentController.getCurrentStudent
)

export default router
