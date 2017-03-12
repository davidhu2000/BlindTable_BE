import * as dynamoDbLib from './js/dynamodb-lib';
import { success, failure } from './js/response-lib';

export async function main(event, context, callback) {
  const params = {
    TableName: 'reservations',
    // 'KeyConditionExpression' defines the condition for the query
    // 'ExpressionAttributeValues' defines the value in the condition

    KeyConditionExpression: "restaurantId = :restaurantId",
    ExpressionAttributeValues: {
      ":restaurantId": event.requestContext.authorizer.claims.sub,
    }
  };

  try {
    const result = await dynamoDbLib.call('query', params);
    // Return the matching list of items in response body
    callback(null, success(result.Items));
  }
  catch(e) {
    callback(null, failure({status: false}));
  }
};
