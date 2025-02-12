import admin, { ServiceAccount } from 'firebase-admin'
import { getFirestore } from 'firebase-admin/firestore'
import serviceAccount from '../env/firebase-admin-sdk.json'

// Ensure serviceAccount is typed correctly
const serviceAccountConfig: ServiceAccount = serviceAccount as ServiceAccount

admin.initializeApp({
  credential: admin.credential.cert(serviceAccountConfig),
})

export default admin
