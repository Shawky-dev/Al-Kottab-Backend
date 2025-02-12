import express, { Request, Response, Router } from 'express'
import { validateData } from '../middleware/validateData'
import studentController from '../controllers/student.controller'

const router: Router = express.Router()

router.post('/newStudent', (req: Request, res: Response) => {
  res.send(req.body)
})
router.get('/getStudent/:uuid', studentController.getStudentFromUUID)

export default router
