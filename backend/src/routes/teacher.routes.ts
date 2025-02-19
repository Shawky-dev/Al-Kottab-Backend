import { Router } from 'express'
import express from 'express'
import teacherController from '../controllers/teacher.controller'
import { validateData } from '../middleware/validateData'
import { teacherSchema } from '../schemas/teacher.schema'

const router: Router = express.Router()

router.get('/getTeacher/:uid', teacherController.getTeacherFromUid)

router.get('/getCurrentTeacher', teacherController.getCurrentTeacher)

router.put(
  '/editTeacher/:uid',
  validateData(teacherSchema),
  teacherController.editTeacherProfile
)

export default router
