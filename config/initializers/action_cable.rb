if Rails.env.development?
    Rails.application.config.action_cable.allowed_request_origins =  ['http://localhost:3001', 'http://127.0.0.1:3001']
end