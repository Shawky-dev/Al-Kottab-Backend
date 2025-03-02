import admin, { ServiceAccount } from 'firebase-admin'
import { getFirestore } from 'firebase-admin/firestore'

// const serviceAccountConfig: ServiceAccount = serviceAccount as ServiceAccount

admin.initializeApp({
  credential: admin.credential.cert({
    projectId: process.env.FIREBASE_PROJECT_ID,
    clientEmail: process.env.FIREBASE_CLIENT_EMAIL,
    // replace `\` and `n` character pairs w/ single `\n` character
    privateKey: process.env.FIREBASE_PRIVATE_KEY?.replace(/\\n/g, '\n'),
  }),
})

function deleteUser(uid: string) {
  admin
    .auth()
    .deleteUser(uid)
    .then(function () {
      console.log('Successfully deleted user', uid)
    })
    .catch(function (error) {
      console.log('Error deleting user:', error)
    })
}
export function DeleteAllUsers(nextPageToken: string | undefined) {
  let uid
  admin
    .auth()
    .listUsers(100, nextPageToken)
    .then(function (listUsersResult) {
      listUsersResult.users.forEach(function (userRecord) {
        uid = userRecord.uid
        deleteUser(uid)
      })
      if (listUsersResult.pageToken) {
        DeleteAllUsers(listUsersResult.pageToken)
      }
    })
    .catch(function (error) {
      console.log('Error listing users:', error)
    })
}
export default admin
