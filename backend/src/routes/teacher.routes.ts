import { Router } from 'express'
import express from 'express'
import teacherController from '../controllers/teacher.controller'
import { validateData } from '../middleware/validateData'
import { teacherSchema } from '../schemas/teacher.schema'
import { verifyToken } from '../middleware/verifyToken'

const router: Router = express.Router()

router.get('/getTeacher/:uid', teacherController.getTeacherFromUid)

router.get('/getCurrentTeacher', teacherController.getCurrentTeacher)

router.put(
  '/editTeacher',
  verifyToken,
  validateData(teacherSchema),
  teacherController.editTeacherProfile
)

router.get('/getAllTeacher', teacherController.getAllTeachers)

export default router
