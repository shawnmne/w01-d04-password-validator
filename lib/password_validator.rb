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
#Takes a string
# Returns true or false depending on if the string is at least 8 characters long
def at_least_eight_characters?(password)
  password.length >= 8
end

#takes a string
#Returns true or false depending on if there is at least on lower case letter
def at_least_one_lower?(password)
	password != password.upcase
end

#takes a string
#returns true if there is at least one number in the string
def at_least_one_number?(password)
	if password.match("[0123456789]") 
		return true
	end
end	

#takes a string
#returns true is the word 'password' is in the password. 
def cant_contain_password?(password)
	if password.match('password') 
    true
	end
end

#takes a string
#returns true if my name 'shawn' is in the password
def cant_contain_name?(password)
	if password.match('shawn')
		true
	end
end

#def at_least_one_special_character?(password)
	#(password.length - (password.gsub(/\W/,"")).length) != 0
#end
