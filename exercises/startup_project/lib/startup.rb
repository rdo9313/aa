require "employee"

class Startup
  attr_accessor :name, :funding, :salaries, :employees
  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end

  def valid_title?(title)
    self.salaries.keys.include?(title)
  end

  def >(startup)
    self.funding > startup.funding
  end

  def hire(employee, title)
    if self.salaries.keys.include?(title)
      self.employees << Employee.new(employee, title)
    else
      raise "Wrong title"
    end
  end

  def size
    self.employees.size
  end

  def pay_employee(employee)
    salary = self.salaries[employee.title]
    if self.funding > salary
      self.funding -=  salary
      employee.pay(salary)
    else
      raise StandardError
    end
  end

  def payday
    self.employees.each { |employee| pay_employee(employee) }
  end

  def average_salary
    sum = 0
    self.employees.each do |employee|
      sum += self.salaries[employee.title]
    end
    sum / self.size
  end

  def close
    self.employees = []
    self.funding = 0
  end

  def acquire(startup)
    self.funding += startup.funding
    startup.salaries.each do |k,v|
      if !self.salaries.keys.include?(k)
        self.salaries[k] = v
      end
    end
    self.employees << startup.employees
    self.employees.flatten!
    startup.close
  end
end
