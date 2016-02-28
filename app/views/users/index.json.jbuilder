json.array!(@users) do |user|
  json.extract! user, :id, :nom, :prenom, :pseudo
  json.url user_url(user, format: :json)
end
