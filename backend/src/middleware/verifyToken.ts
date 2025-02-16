import { NextFunction, Response } from 'express'
import { AuthorizationRequest } from '../types/express/index'
import db from '../config/firebase.config'
import { getTokenFromHeaders } from '../utils/utils'
import { StatusCodes } from 'http-status-codes'
import { messaging } from 'firebase-admin'

export const verifyToken = async (
  req: AuthorizationRequest,
  res: Response,
  next: NextFunction
): Promise<void> => {
  const token = getTokenFromHeaders(req)

  if (!token) {
    res.status(StatusCodes.UNAUTHORIZED).json({ message: 'no Token Provided' })
    return
  }
  try {
    const decodedToken = await db.auth().verifyIdToken(token)
    req.user = decodedToken
    next()
  } catch (error) {
    res
      .status(StatusCodes.FORBIDDEN)
      .json({ message: 'Invalid or Expired token' })
    return
  }
}
