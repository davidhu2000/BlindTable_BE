import * as dynamoDbLib from './js/dynamodb-lib';
import { success, failure } from './js/response-lib';

export async function main(event, context, callback) {
  const params = {
    TableName: 'reservations',

    Key: {
      restaurantId: event.requestContext.authorizer.claims.sub,
      reservationId: event.pathParameters.id,
    },
  };

  try {
    const result = await dynamoDbLib.call('delete', params);
    callback(null, success({status: true}));
  }
  catch(e) {
    callback(null, failure({status: e.message}));
  }
};
