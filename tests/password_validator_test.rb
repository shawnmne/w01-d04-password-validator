require "test_helper"
require_relative "../lib/password_validator.rb"

class PasswordValidatorTest < Minitest::Test
  # We'll try a password with all-lower-case-letters
  def test_rejects_all_lower_case_passwords
    result = at_least_one_caps?("1abjils&a")
    refute(result, "'1abjils&a' should be invalid because it contains no caps")
    #assert(result == false, ".same message as above")
  end

  # We try a password with a valid mix of upper and lower-case characters
  def test_accepts_mixed_case_passwords
    result = at_least_one_caps?("1Abjils&a")
    assert(result, "'1Abjils&a' should be valid because it is mixed case")
  end

  # We try a password of 8 characters, expecting success
  def test_accepts_password_of_8_characters
    result = at_least_eight_characters?("1Abjils&")
    assert(result, "'1ABjils&' has 8 characters, should be valid")
  end
  
  # We try a password of only 7 characters, expecting rejection
  def test_rejects_password_of_7_characters
    result = at_least_eight_characters?("1Abils&")
    refute(result, "'1ABils&' has 8 characters, should be valid")
  end

  def test_valid_password
    result = valid_password?("1Abils&a")
    assert(result, "'1Abils&a' should be valid")
  end

# Try a password with all-upper-case-letters
  def test_reject_all_upper_case_passwords
    result = at_least_one_lower?("1ABJILS&A")
    refute(result, "'1ABJILS&A' should be invalid because it contains no caps")
  end

# Try a password with mixed cases
  def test_accepts_mixed_case_passwords_lower_case
    result = at_least_one_lower?("1Abils&a")
    assert(result, "'1Abils&a' should be vaild because it is mixed case")
  end

# Try a password with no numbers
  def test_reject_no_numbers_password
    result = at_least_one_number?("Abils&a")
    refute(result, "'Abils&a' should be invalid because it contains no numbers")
  end 

#try a password with numbers
  def test_accept_numbers_in_password
    result = at_least_one_number?("1Abils&a")
    assert(result,"'1Abils&a' should be valid because it has a number")
  end

# try a password with "password" in it
  def test_reject_password_in_password
    result = !cant_contain_password?("abpassword")
    refute(result, "'abpassword' should be invalid because it contains 'password'")
  end

 #try a valid password
  def test_accept_no_password_in_password
    result = !cant_contain_password?("1Abils&a")
    assert(result,"'1Abils&a' should be valid because it does not contain 'password'")
  end 

# try a password with my name
  def test_reject_name_in_password
    result = !cant_contain_name?("1abshawn")
    refute(result,"'1abshawn' should be invalid because it contains my name")
  end

#try a password without my name
  def test_accept_good_password
    result = !cant_contain_name?("1Abils&a")
    assert(result,"'1Abils&a' should be valid because it does not contain my name")
   end   
end
