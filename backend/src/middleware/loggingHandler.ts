import { Request, Response, NextFunction } from 'express'

export const loggingHandler = (
  req: Request,
  res: Response,
  next: NextFunction
): void => {
  logging.log(
    `Incoming - METHOD: [${req.method}] \n -URL:[${req.url}] \n -IP: [${req.socket.remoteAddress}] \n -BODY:[${req.body}]`
  )
  res.on('finish', () => {
    logging.log(
      `incoming FINISHED METHOD: [${req.method}] \n -URL:[${req.url}] \n -IP: [${req.socket.remoteAddress}] \n -STATUS: [${res.statusCode}]`
    )
  })

  next()
}
