
def add_user
  admin = User.find_by_username('bazooka')
  if admin.blank?
    User.create({
        :username => 'bazooka',
        :password => 'bazooka',
        :first_name => 'Admin',
        :last_name => 'Account'
      })
    puts "Account Created"
    puts "Username : bazooka"
    puts "Password : bazooka"
  else
    puts "Bazooka account already exists"
  end
end

add_user
