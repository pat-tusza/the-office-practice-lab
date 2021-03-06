class Role

    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        self.class.all << self
    end

    def self.all
        @@all
    end

    def employees
        Employee.all.select {|employee| employee.role == self}
    end

    def managers
        employees.map(&:manager)
    end

    #adds employee to existing role
    def add_employee(string,salary,manager)
        Employee.new(string,salary,manager,self)
    end
end