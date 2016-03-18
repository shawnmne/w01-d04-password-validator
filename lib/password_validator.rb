require "pry"

def valid_password?(password)
  at_least_one_caps?(password) && 
  at_least_eight_characters?(password) &&
  at_least_one_lower?(password) &&
  at_least_one_number?(password) &&  
  !cant_contain_password?(password) &&
  !cant_contain_name?(password)

end

# Takes a string
# Returns true or false depending on if the string has at least one capital
# letter
def at_least_one_caps?(password)
  password != password.downcase
end

def at_least_eight_characters?(password)
  password.length >= 8
end

def at_least_one_lower?(password)
	password != password.upcase
end

def at_least_one_number?(password)
	if password.match("[0123456789]") 
		return true
	end
end	

def cant_contain_password?(password)
	if password.match('password') 
    true
	end
end

def cant_contain_name?(password)
	if password.match('shawn')
		true
	end
end