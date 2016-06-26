require 'pry'
class PasswordChecker    

    def check_password (email, password)
        
        correct = true
        correct = false unless contains_enough_letter(password)
        correct = false unless contains_number(password)
        correct = false unless contains_symbol(password)
        correct = false unless contains_uppercase(password)
        correct = false unless contains_lowercase(password)
        correct
        
    end     
    def contains_enough_letter(password)
             password.size > 7
        
    end 
    
    def contains_number(password, includes = false)
        password_ord = password.split('').map{ |letter|letter.ord}
        password_ord.each { |number| includes = true if (48..57).to_a.include?(number)}
        includes
    end    

    def contains_symbol(password, includes = false)
        password_ord = password.split('').map{ |letter|letter.ord}
        password_ord.each { |number| includes = true if (33..47).to_a.include?(number)}
        password_ord.each { |number| includes = true if (91..96).to_a.include?(number)}
        password_ord.each { |number| includes = true if (123..126).to_a.include?(number)}
        
        includes
    end    

    def contains_uppercase(password, includes = false)
        password_ord = password.split('').map{ |letter|letter.ord}
        password_ord.each { |number| includes = true if (65..90).to_a.include?(number)}
        includes
    end     

    def contains_lowercase(password, includes = false)
        password_ord = password.split('').map{ |letter|letter.ord}
        password_ord.each { |number| includes = true if (97..122).to_a.include?(number)}
        includes
    end     

    def does_not_contain_name(password, email)
        name = email.split('@')[0]
        !password.include? name
    end     

    def does_not_contain_email(password, email)
        name = email.split('@')[1]
        emailmod = name.split('.')[0]
        !password.include?emailmod
    end
end