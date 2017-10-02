task :test_message => :environment do
    require 'sendgrid-ruby'
    include SendGrid
    
    puts "ALBERTO IS AWESOME: SENDING EMAIL"
    
    from = Email.new(email: 'alberto@alberto.com')
    to = Email.new(email: 'melvinnnnnnnnnnnnnnnnnnnnnnnnn@gmail.com')
    subject = 'Hello Alberto'
    content = Content.new(type: 'text/plain', value: 'I hope you like this spam email!')
    mail = Mail.new(from, subject, to, content)
    
    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts response.status_code
    puts response.body
    puts response.headers
end