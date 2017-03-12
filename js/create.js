import * as dynamoDbLib from './helpers/dynamodb-lib';
import { success, failure } from './helpers/response-lib';

export async function main(event, context, callback) {
  const data = JSON.parse(event.body);
  const params = {
    TableName: 'reservations',
    Item: {
      restaurantId: event.requestContext.authorizer.claims.sub,
      reservationId: data.reservationId,
      addresss: data.address,
      city: data.city,
      state: data.state,
      postal_code: data.postal_code,
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