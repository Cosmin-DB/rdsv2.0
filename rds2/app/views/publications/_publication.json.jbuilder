json.extract! publication, :id, :text, :date, :user_id, :created_at, :updated_at
json.url publication_url(publication, format: :json)
