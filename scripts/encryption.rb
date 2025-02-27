# to encrypt a secret, use BCrypt::Password.create(secret)
# to test a secret, use BCrypt::Password.new(encrypted) == secret
# run this file using rails runner scripts/encryption.rb

# TODO:
# 1. encrypt a secret and puts encrypted string
password = "puppies"
encrypted_password = BCrypt::Password.create(password)
puts encrypted_password
# $2a$12$9GddH7jTa0DqHFodEYrYO.DteWGdOhcGuKhxfbsQhwBpA0mzkapKq


# 2. prepare encrypted string for testing

puts BCrypt::Password.new(encrypted_password) == "puppies" # first part is preparing the code to be tested, then it tests it against an input
# true should return 

# 3. test secret against prepared encrypted string
