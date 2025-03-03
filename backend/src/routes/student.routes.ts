import express, { Request, Response, Router } from 'express'
import { validateData } from '../middleware/validateData'
import studentController from '../controllers/student.controller'
import { verifyToken } from '../middleware/verifyToken'
import { editProfileStudentSchema } from '../schemas/student/editProfile.student.schema'
import { registerSchema } from '../schemas/register.schema'

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

router.post(
  '/registerStudent',
  validateData(registerSchema),
  studentController.registerStudent
)

export default router
