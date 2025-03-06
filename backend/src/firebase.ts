import * as admin from 'firebase-admin';
import * as serviceAccount from './serviceAccountKey.json';
import { getFirestore } from 'firebase-admin/firestore';

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount as admin.ServiceAccount)
});

const db = getFirestore();
export { db };