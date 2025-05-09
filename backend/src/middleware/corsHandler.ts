import { Request, Response, NextFunction } from 'express'
import { StatusCodes } from 'http-status-codes'

export const corsHandler = (
  req: Request,
  res: Response,
  next: NextFunction
): void => {
  res.header('Access-Control-Allow-Origin', req.header('origin'))
  res.header(
    'Access-Control-Allow-Headers',
    'Origin. X-Requested-With, Content-Type, Accept, Authorization'
  )
  res.header('Access-Control-Allow-Credentials', 'true')

  if (req.method === 'OPTIONS') {
    res.header('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, PATCH')
    res.status(StatusCodes.NO_CONTENT).json({})
    return
  }

  next()
}
