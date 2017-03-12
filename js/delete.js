import * as dynamoDbLib from './helpers/dynamodb-lib';
import { success, failure } from './helpers/response-lib';

export async function main(event, context, callback) {
  const params = {
    TableName: 'reservations',
    // 'Key' defines the partition key and sort key of the time to be removed
    // - 'userId': User Pool sub of the authenticated user
    // - 'reservationId': path parameter
    Key: {
      userId: event.requestContext.authorizer.claims.sub,
      reservationId: event.pathParameters.id,
    },
  };

  try {
    const result = await dynamoDbLib.call('delete', params);
    callback(null, success({status: true}));
  }
  catch(e) {
    callback(null, failure({status: false}));
  }
};
