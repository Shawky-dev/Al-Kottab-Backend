import express, { Router } from 'express'
import { verifyToken } from '../middleware/verifyToken'
import { validateData } from '../middleware/validateData'

const router: Router = express.Router()

router.post(
  '/reserveTeacher',
  verifyToken,
  validateData(),
  reservationController.reserveTeacher
)
