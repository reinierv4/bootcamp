require_relative '../lib/password_checker.rb'
RSpec.describe PasswordChecker do     
  it "returns false if password is less than 7 characters" do
        expect(PasswordChecker.new.contains_enough_letter("passw")).to be_falsey
  end    
    it "returns false if password does not contain a number" do
        expect(PasswordChecker.new.contains_number("passw")).to be_falsey
  end    it "return false if the password does not contain a symbol" do
        expect(PasswordChecker.new.contains_symbol("passw")).to be_falsey
    end    it "returns false if password does not contain a uppercase" do
        expect(PasswordChecker.new.contains_uppercase("passw")).to be_falsey
    end    it "returns false if password does not lowercase" do
        expect(PasswordChecker.new.contains_lowercase("12ERD")).to be_falsey
    end    it "returns true when the password contains at least 1 letter, 1 number and 1 symbol" do
        expect(PasswordChecker.new.check_password("snawabzada@gmail.com","#sAt96729899")).to be true
    end    it "does not contain name" do
       expect(PasswordChecker.new.does_not_contain_name("snawabzada@gmail.com","#snawabzadaK#729899")).to be false
   end    it "does not contain email" do
       expect(PasswordChecker.new.does_not_contain_email("reiner@gmail.com","#sAt96729899")).to be true
   endend