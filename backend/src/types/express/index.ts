import { Request } from 'express'
import { DecodedIdToken } from 'firebase-admin/auth'

export interface AuthorizationRequest extends Request {
  user?: DecodedIdToken
}
