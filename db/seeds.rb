puts 'CREATING ROLES'
Role.create([
  { :name => 'admin' }, 
  { :name => 'user' }, 
  { :name => 'VIP' }
], :without_protection => true)
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'New user created: ' << user.name
user2 = User.create! :name => 'Second User', :email => 'user2@example.com', :password => 'alejandroplease', :password_confirmation => 'alejandroplease'
puts 'New user created: ' << user2.name
user.add_role :admin
user2.add_role :VIP
