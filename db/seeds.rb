require 'highline/import'
unless User.any?
  email                 = ask("Type admin user email: ")
  password              = ask("Type admin user password: ")       { |q| q.echo = "x" }
  password_confirmation = ask("Type admin user password again: ") { |q| q.echo = "x" }
  user = User.create  email: email,
                      password: password,
                      password_confirmation: password_confirmation

end
