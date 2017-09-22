json.extract! charge, :id, :booking_id, :amount, :token, :paid, :created_at, :updated_at
json.url charge_url(charge, format: :json)
