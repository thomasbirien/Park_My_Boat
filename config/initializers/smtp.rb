ActionMailer::Base.smtp_settings = {
  user_name: ENV['SENGRID_USERNAME'],
  password: ENV['SENGRID_PASSWORD'],
  domain: 'park-my-boat.herokuapp.com/',
  address: 'smtp.sendgrid.net',
  port: 587,
  authentication: :plain,
  enable_starttls_auto: true
}
