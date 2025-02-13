import { NextFunction, Request, Response } from 'express'
import { StatusCodes } from 'http-status-codes'

import { z } from 'zod'

export const validateData = (schema: z.ZodObject<any, any>) => {
  return (req: Request, res: Response, next: NextFunction) => {
    try {
      schema.parse(req.body)
      next()
    } catch (err) {
      if (err instanceof z.ZodError) {
        logging.error(err.errors)
        res
          .status(StatusCodes.BAD_REQUEST)
          .json({ message: 'Invalid Data', details: err.errors })
      } else {
        //not a zod error
        res
          .status(StatusCodes.INTERNAL_SERVER_ERROR)
          .json({ message: 'Internal Server Error' })
      }
    }
  }
}
