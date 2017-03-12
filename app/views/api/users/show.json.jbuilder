# json.extract! @user, :id, :first_name, :last_name, :description, :image_url

json.first_name @user.first_name
json.last_name @user.last_name
json.phone_number @user.phone_number
json.authy_id @user.authy_id
json.session_token @user.session_token
json.image_url @user.image_url
json.description @user.description
