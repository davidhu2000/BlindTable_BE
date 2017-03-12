import * as dynamoDbLib from './helpers/dynamodb-lib';
import { success, failure } from './helpers/response-lib';

export async function main(event, context, callback) {
  const params = {
    TableName: 'reservations',

    Key: {
      restaurantId: event.requestContext.authorizer.claims.sub,
      reservationId: event.pathParameters.id,
    },
  };

  try {
    const result = await dynamoDbLib.call('get', params);

    if (result.Item) {
      // Return the retrieved item
      callback(null, success(result.Item));
    }
    else {
      callback(null, failure({status: false, error: 'Item not found.'}));
    }
  }
  catch(e) {
    callback(null, failure({status: e.message}));
  }
};
