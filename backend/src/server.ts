import http from 'http'
import express from 'express'
import './config/logging.config'
import { Request, Response, NextFunction } from 'express'
import { StatusCodes } from 'http-status-codes'
import { corsHandler } from './middleware/corsHandler'

//custom imports
import { loggingHandler } from './middleware/loggingHandler'
import { routeNotFound } from './middleware/routeNotFound'
import { SERVER } from './config/config'
//router imports
import studentRouter from './routes/student.routes'
import teacherRouter from './routes/teacher.routes'

import db from './config/firebase.config'

export const app: express.Application = express()

export let httpServer: ReturnType<typeof http.createServer>

export const Main = () => {
  logging.info('-----------------')
  logging.info('Initializing API')
  logging.info('-----------------')
  //parsing request body
  app.use(express.urlencoded({ extended: true }))
  app.use(express.json())
  logging.info('-----------------')
  logging.info('Logging & Configuration')
  logging.info('-----------------')
  //middleware and stuff
  app.use(loggingHandler)
  app.use(corsHandler)
  logging.info('-----------------')
  logging.info('Intialize Firebase')
  try {
    db
    logging.info('✅ Firebase Initialized')
  } catch (err) {
    logging.error(err)
  }
  logging.info('-----------------')
  logging.info('-----------------')
  logging.info('Controller Routing')
  logging.info('-----------------')
  app.get('/', (req, res, next) => {
    res.send('yoooo!')
  })

  app.get('/api/healthCheck', (req, res, next) => {
    res.status(StatusCodes.OK).json({ message: 'ok' })
  })
  app.use('/api/student', studentRouter)
  app.use('/api/teacher', teacherRouter)
  logging.info('-----------------')
  logging.info('404 route')
  logging.info('-----------------')
  app.use(routeNotFound)

  logging.info('-----------------')
  logging.info('Starting Server')
  logging.info('-----------------')
  httpServer = http.createServer(app)
  httpServer.listen(SERVER.PORT, () => {
    logging.info(
      'Server running on http://' + SERVER.HOSTNAME + ':' + SERVER.PORT
    )
  })
}

export const Shutdown = (callback: any) => {
  if (httpServer) {
    logging.info('-----------------')
    logging.info('Shutting Down Server')
    logging.info('-----------------')
    httpServer.close(callback)
  }
}

Main()
