import http from 'http'
import express from 'express'
import './config/logging'
import { Request, Response, NextFunction } from 'express'
import { corsHandler } from './middleware/corsHandler'
import { loggingHandler } from './middleware/loggingHandler'
import { routeNotFound } from './middleware/routeNotFound'
import { log } from 'console'
import { SERVER } from './config/config'
import { StatusCodes } from 'http-status-codes'

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
  logging.info('Controller Routing')
  logging.info('-----------------')
  app.get('/api/healthCheck', (req, res, next) => {
    res.status(StatusCodes.OK).json({ message: 'ok' })
  })

  logging.info('-----------------')
  logging.info('404 route')
  logging.info('-----------------')
  app.use(routeNotFound)

  logging.info('-----------------')
  logging.info('Starting Server')
  logging.info('-----------------')
  httpServer = http.createServer(app)
  httpServer.listen(SERVER.PORT, () => {
    logging.info('Server running on ' + SERVER.HOSTNAME + ':' + SERVER.PORT)
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
