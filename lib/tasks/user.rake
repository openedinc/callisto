namespace :user do

  desc "Create a new user"
  task :create, [:email, :password] => :environment do |task, args|
    email = args.email
    password = args.password
    if email.present? and password.present?
      user = User.where(email: email).first_or_create(password: password)
    else
      puts 'Email and/or password not provided. Please try again.'
    end

  end
end
