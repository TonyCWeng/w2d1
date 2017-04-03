class Employee
  attr_reader :name, :title, :salary, :boss

  def initialize(name, salary)
    @name = name
    @salary = salary
    #@boss = nil
  end

  def bonus(multiplier)
    salary * multiplier
  end

end

class Manager < Employee

  def initialize(name, salary)
    super(name, salary)
    @employees = []
  end

  def bonus(multiplier)
    total_employee_salary * multiplier
  end

  def add_employee(name)
    @employees << name
    #name.boss = self
  end

  # def subordinates
  #   @employees
  # end

  def total_employee_salary
    sum = 0
    @employees.each do |employee|
      if employee.is_a?(Manager)
        sum += employee.total_employee_salary
        sum += employee.salary
      else
        sum += employee.salary
      end
    end
    sum
  end
end

ned = Manager.new("Ned", 1_000_000)
darren = Manager.new("Darren", 78_000)
shawna = Employee.new("Shawna", 12_000)
david = Employee.new("David", 10_000)
ned.add_employee(darren)
darren.add_employee(shawna)
darren.add_employee(david)
