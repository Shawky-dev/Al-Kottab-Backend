import dotenv from 'dotenv'

dotenv.config()

export const DEVELOPMENT = process.env.NODE_ENV === 'development'
export const TEST = process.env.NODE_ENV === 'test'
export const HOSTNAME = process.env.SERVER_HOSTNAME || 'localhost'
export const PORT = process.env.PORT ? Number(process.env.PORT) : 8080

export const SERVER = {
  HOSTNAME,
  PORT,
  DEVELOPMENT,
}
