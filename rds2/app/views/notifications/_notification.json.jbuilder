json.extract! notification, :id, :text, :type, :user_id, :created_at, :updated_at
json.url notification_url(notification, format: :json)
