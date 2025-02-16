import { Request } from 'express'
export const getTokenFromHeaders = (req: Request): string | undefined => {
  const authHeader = req.headers.authorization
  if (authHeader && authHeader.startsWith('Bearer ')) {
    return authHeader.substring(7) // Removes "Bearer " and returns the token
  }
  return undefined
}
