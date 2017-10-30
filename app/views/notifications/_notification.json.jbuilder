json.extract! notification, :id, :recipient_id, :booking_id, :confidence, :action, :read_at, :created_at, :updated_at
json.url notification_url(notification, format: :json)
