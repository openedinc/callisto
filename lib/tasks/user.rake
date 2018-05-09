namespace :user do

  def create_user(args)
    email = args.email
    password = args.password
    if email.present? && password.present?
      if Devise.password_length.cover?(password.length)
        yield(email, password)
      else
        puts "Password must be #{Devise.password_length} characters."
      end
    else
      puts 'Email and/or password not provided. Please try again.'
    end
  end

  desc "Create a new user"
  task :create, [:email, :password] => :environment do |task, args|
    create_user(args) do |email, password|
      User.where(email: email).first_or_create!(password: password)
    end
  end

  desc "Create a new ActiveAdmin user"
  task :create_admin, [:email, :password] => :environment do |task, args|
    create_user(args) do |email, password|
      AdminUser.where(email: email).first_or_create!(password: password)
    end
  end
end
