import { Router } from 'express'
import express from 'express'
import teacherController from '../controllers/teacher.controller'

const router: Router = express.Router()

router.get('/getTeacher/:uid', teacherController.getTeacherFromUid)

router.get('/getCurrentTeacher', (req, res) => {
  res.send('yo')
})

router.put('/editStudent/:uid', (req, res) => {
  res.send('yo')
})

export default router
