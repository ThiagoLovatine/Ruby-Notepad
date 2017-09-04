json.extract! contact, :id, :name, :email, :type_id, :rmk, :created_at, :updated_at
json.url contact_url(contact, format: :json)
