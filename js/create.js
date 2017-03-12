import * as dynamoDbLib from './js/dynamodb-lib';
import { success, failure } from './js/response-lib';

export async function main(event, context, callback) {
  const data = JSON.parse(event.body);
  const params = {
    TableName: 'reservations',
    Item: {
      restaurantId: data.restaurantId,
      reservationId: data.reservationId,
      addresss: data.address,
      city: data.city,
      state: data.state,
      postalCode: data.postal_code,
      users: data.users,
      createdAt: new Date().getTime(),
    },
  };

  try {
    const result = await dynamoDbLib.call('put', params);
    callback(null, success(params.Item));
  }
  catch(e) {
    callback(null, failure({status: e.message}));
  }
};
