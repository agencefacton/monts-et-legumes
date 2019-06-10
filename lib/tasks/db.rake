namespace :db do
  task import: :environment do
    cmd = "DISABLE_DATABASE_ENVIRONMENT_CHECK=1 rails db:drop;"
    cmd += "heroku pg:pull postgresql-defined-19042 mayeres_development;"
    cmd += "rails db:create db:migrate RAILS_ENV=test"
    sh cmd
    User.update_all(encrypted_password: '$2a$11$yLB/vfgTnbnL4bAFRzea9u25wNAi9j5u8Idlt3UwoZcQmMpd26GPW')
  end
end
