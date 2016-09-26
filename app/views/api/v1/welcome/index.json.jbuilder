json.partial! 'api/v1/shared/success'

json.data do
  json.user @user.email
end