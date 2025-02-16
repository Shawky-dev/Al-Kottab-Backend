import { Request, Response, NextFunction } from 'express'

export const routeNotFound = (
  req: Request,
  res: Response,
  next: NextFunction
): void => {
  const err = new Error('Route not found')
  logging.error(err)
  res.status(404).json({ message: err.message })
  next()
}
