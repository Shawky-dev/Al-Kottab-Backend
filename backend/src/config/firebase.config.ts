import { initializeApp, cert, ServiceAccount } from 'firebase-admin/app'
import { getFirestore } from 'firebase-admin/firestore'
import serviceAccount from '../env/firebase-admin-sdk.json'

// Ensure serviceAccount is typed correctly
const serviceAccountConfig: ServiceAccount = serviceAccount as ServiceAccount

try {
  initializeApp({
    credential: cert(serviceAccountConfig),
  })
  console.log('Firebase initialized successfully')
} catch (error) {
  console.error('Error initializing Firebase:', error)
}

const db: FirebaseFirestore.Firestore = getFirestore()
export default db
