require 'date'
# Defines a Todo class
class Todo
  attr_accessor :title
  attr_reader :due_date

  @@todo_list = []
  def initialize(title, due_date = Date.today)
    @title = title
    @due_date = due_date
  end

# setter method for due_date
  def due_date=(due_date)
    @due_date = Date.parse(due_date)
  end

# class methods
  def self.todo_list(todo)
    @@todo_list << todo
  end

  def self.all
    @@todo_list
  end

  def self.last
    @@todo_list[-1]
  end
end
