require 'date'
#require 'pry'
# Defines a Todo class
class Todo
  attr_accessor :title
  attr_reader :due_date

  @@todo_list = []
  def initialize(title, due_date = Date.today)
    @title = title
    if due_date.is_a? String
      @due_date = Date.parse(due_date)
    else
      @due_date = Date.today
    end
    @@todo_list << self
  end

# setter method for due_date
  def due_date=(due_date)
    @due_date = Date.parse(due_date)
  end

  def self.all
    @@todo_list
  end

  def self.last
    @@todo_list[-1]
  end

  def self.find(params = {})
    if params[:contains]
      self.contains(params[:contains])
    elsif params[:exactly]
      self.exactly(params[:exactly])
    end
  end

  private

  def self.contains(value)
    results = []
    @@todo_list.each do |todo|
      if todo.title.include? value
        results << todo
      end
    end
    return results
  end

  def self.exactly(value)
    results = []
    @@todo_list.each do |todo|
      if todo.title == value
        results << todo
      end
    end
    return results
  end
end

todo1 = Todo.new 'Remember the Milk', '10 Oct 2016'
todo2 = Todo.new 'Buy spoons', '11 Dec 2016'
todo3 = Todo.new 'Drink Milk', Date.today
Todo.find contains: 'Milk'
