task :test_message => :environment do
    require 'sendgrid-ruby'
    
    sendgrid = SendGrid::Client.new do |c|
        c.api_key = 'SENDGRID_APIKEY'
      end
      
      email = SendGrid::Mail.new do |m|
        m.to      = 'melvinnnnnnnnnnnnnnnnnnnnnnnnn@gmail.com'
        m.from    = 'alberto@alberto.com'
        m.subject = 'Spamming Alberto is fun'
        m.html    = 'it is easy, even with Ruby'
      end
      
      sendgrid.send(email)
end