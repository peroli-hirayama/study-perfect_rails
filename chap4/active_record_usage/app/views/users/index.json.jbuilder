json.array!(@users) do |user|
  json.extract! user, :id, :firstname, :family_name, :email
  json.url user_url(user, format: :json)
end
