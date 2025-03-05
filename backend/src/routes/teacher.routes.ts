import { Router } from 'express'
import express from 'express'
import teacherController from '../controllers/teacher.controller'
import { validateData } from '../middleware/validateData'
import { verifyToken } from '../middleware/verifyToken'
import { editProfileTeacherSchema } from '../schemas/teacher/editProfile.teacher.schema'
import { registerSchema } from '../schemas/register.schema'
import { selectTimeSlotTeacherSchema } from '../schemas/teacher/selectTimeSlot.teacher.schema'

const router: Router = express.Router()

router.get('/getTeacher/:uid', teacherController.getTeacherFromUid)

router.get(
  '/getCurrentTeacher',
  verifyToken,
  teacherController.getCurrentTeacher
)

router.post(
  '/registerTeacher',
  validateData(registerSchema),
  teacherController.registerTeacher
)

router.put(
  '/editTeacher',
  verifyToken,
  validateData(editProfileTeacherSchema),
  teacherController.editTeacherProfile
)

router.get('/getAllTeacher', teacherController.getAllTeachers)

router.put(
  '/selectTimeSlot',
  verifyToken,
  validateData(selectTimeSlotTeacherSchema),
  teacherController.selectTimeSlot
)

export default router
