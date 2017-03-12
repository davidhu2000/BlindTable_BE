import * as dynamoDbLib from './helpers/dynamodb-lib';
import { success, failure } from './helpers/response-lib';

export async function main(event, context, callback) {
  const data = JSON.parse(event.body);
  const params = {
    TableName: 'reservations',
    Item: {
      restaurantId: event.requestContext.authorizer.claims.sub,
      reservationId: data.content,
      users: data.users,
      createdAt: new Date().getTime(),
    },
  };

  try {
    const result = await dynamoDbLib.call('put', params);
    callback(null, success(params.Item));
  }
  catch(e) {
    callback(null, failure({status: false}));
  }
};
