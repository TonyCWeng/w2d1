class Employee
  attr_reader :name, :title, :salary, :boss

  def bonus(multiplier)
    salary * multiplier
  end

end

class Manager < Employee

  def initialize(name)
    @name = name
    @employees = []
  end

  def bonus(multiplier)
    total_employee_salary * multiplier
  end

  def total_employee_salary
    sum = 0
    employees.each { |employee| sum += employee.salary }
  end
end
