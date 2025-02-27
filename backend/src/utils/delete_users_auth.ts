import admin from '../config/firebase.config'
import { ListUsersResult, UserRecord } from 'firebase-admin/auth'
import { colours } from '../config/logging.config'

const listAllUsers = (nextPageToken?: string): void => {
  console.log('list all users')
  // List batch of users, 1000 at a time.
  admin
    .auth()
    .listUsers(1000, nextPageToken)
    .then((listUsersResult: ListUsersResult) => {
      listUsersResult.users.forEach((userRecord: UserRecord) => {
        const user = userRecord.toJSON() as { uid: string }
        admin
          .auth()
          .deleteUser(user.uid)
          .then(() => {
            logging.log(
              `successfully deleted user ${userRecord.email} From`,
              colours.fg.crimson,
              `Auth`,
              colours.reset
            )
          })
          .catch((err: Error) => {
            console.error('error deleting user: ', err)
          })
      })
      if (listUsersResult.pageToken) {
        // List next batch of users.
        listAllUsers(listUsersResult.pageToken)
      }
    })
    .catch((error: Error) => {
      console.log('Error listing users:', error)
    })
}
listAllUsers()
