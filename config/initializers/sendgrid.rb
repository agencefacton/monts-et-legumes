if Rails.env.production?
  ActionMailer::Base.smtp_settings = {
    username: ENV['SENDGRID_USERNAME'],
    password: ENV['SENDGRID_PASSWORD'],
    domain: 'http://monts-et-legumes.fr',
    address: 'smtp.sendgrid.net',
    port: 587,
    authentication: :plain,
    enable_starttls_auto: true
  }
end
