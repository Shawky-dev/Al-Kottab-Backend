import express, { Request, Response, Router } from 'express'
import { validateData } from '../middleware/validateData'
import studentController from '../controllers/student.controller'
import { verifyToken } from '../middleware/verifyToken'
import { editProfileStudentSchema } from '../schemas/student/editProfile.student.schema'

const router: Router = express.Router()

router.get('/getStudent/:uid', studentController.getStudentFromUid)

router.put(
  '/editStudent',
  verifyToken,
  validateData(editProfileStudentSchema),
  studentController.editStudentProfile
)

router.get(
  '/getCurrentStudent',
  verifyToken,
  studentController.getCurrentStudent
)

export default router
