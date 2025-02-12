import express, { Request, Response, Router } from 'express'
import { validateData } from '../middleware/validateData'
import studentController from '../controllers/student.controller'
import { studentSchema } from '../schemas/student.schema'

const router: Router = express.Router()

router.post(
  '/editStudent/:uuid',
  validateData(studentSchema),
  studentController.editStudentProfile
)
router.get('/getStudent/:uuid', studentController.getStudentFromUUID)

export default router
