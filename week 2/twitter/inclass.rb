require 'net/smtp'

module hourly

  def pay_hours(hours, salary)
    hours * salary
  end

end

class Employee
   attr_reader :name, :email
   def initialize(name, email)
     @name = name
     @email = email
   end
end

class HourlyEmployee < Employee
   def initialize(name, email, hourly_rate, hours_worked)
       @name = name
       @email = email
       @hourly_rate = hourly_rate.to_i
       @hours_worked = hours_worked.to_i
   end



   def calculate_salary
         @hours_worked * @hourly_rate
   end
end

class SalariedEmployee < Employee
   
   include hourly
   def initialize(name, email, yearly_rate)
       @name = name
       @email = email
       @yearly_rate = yearly_rate.to_i
   end

   def calculate_salary
     @yearly_rate/52
   end
end

class MultiPaymentEmployee < Employee
   
   def initialize(name, email, yearly_rate, hourly_rate, hours_worked)
       @name = name
       @email = email
       @yearly_rate = yearly_rate.to_i

       @hourly_rate= hourly_rate.to_i
       @hours_worked = hours_worked.to_i
   end

   def calculate_salary
     @yearly_rate/52 + @hourly_rate * @hours_worked
   end
end

class Payroll
   def initialize(employees)
       
       @employees = employees
   end
   def notify_employee(employee)
    @employees.each do |employee|
    send_email employee.email, :body => "We will pay you #{employee.calculate_salary}"

    end
    
    def send_mail
      #to do
      
   end



 def pay_employees
    
    @employees.each do |employee|
     puts "#{employee.name} => #{employee.calculate_salary*0.82}"
   end
 end
end

josh = HourlyEmployee.new('Josh', 'nachoemail@example.com', 35, 50)
nizar = SalariedEmployee.new('Nizar', 'starcraftrulez@gmail.com', 1000000)
ted = MultiPaymentEmployee.new('Ted', 'fortranr0x@gmail.com', 60000, 275, 55)
satwat = HourlyEmployee.new('Satwat','satawat@szksdnf.com', 15, 50)
reinier = HourlyEmployee.new('Reinier','reinier@szksdnf.com', 15, 50)

employees = [josh, nizar, ted, satwat, reinier]
# payroll = Payroll.new(employees)
# payroll.pay_employees
satawat.pay_hours(10,5)
