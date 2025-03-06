import admin, { ServiceAccount } from 'firebase-admin';
import { getFirestore } from 'firebase-admin/firestore';
import { db } from '../firebase'; // Correctly import db

// Ensure serviceAccount is typed correctly
const serviceAccountConfig: ServiceAccount = db as unknown as ServiceAccount;

admin.initializeApp({
  credential: admin.credential.cert(serviceAccountConfig),
});

export default admin;