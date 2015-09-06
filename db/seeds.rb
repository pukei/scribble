user = {
  name: 'me',
  email: 'paresharma@gmail.com',
  password: 'password',
  password_confirmation: 'password'
}

u = User.find_or_initialize_by(email: user[:email])
u.update_attributes user
