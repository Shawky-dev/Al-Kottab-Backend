import admin, { ServiceAccount } from 'firebase-admin'
import { getFirestore } from 'firebase-admin/firestore'
// const serviceAccountConfig: ServiceAccount = serviceAccount as ServiceAccount
import dotenv from 'dotenv'
dotenv.config()
admin.initializeApp({
  credential: admin.credential.cert({
    projectId: process.env.FIREBASE_PROJECT_ID,
    clientEmail: process.env.FIREBASE_CLIENT_EMAIL,
    // replace `\` and `n` character pairs w/ single `\n` character
    privateKey: process.env.FIREBASE_PRIVATE_KEY?.replace(/\\n/g, '\n'),
  }),
})

export default admin
