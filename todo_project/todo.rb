require 'date'
#require 'pry'
# Defines a Todo class
class Todo
  attr_accessor :title
  attr_reader :due_date

  def initialize(title, due_date = Date.today)
    @title = title
    @due_date = due_date
    @@todo_list = []
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

  def self.find(params = {})
    if params[:contains]
      self.contains(params[:contains])
    elsif params[:exactly]
      self.exactly(params[:exactly])
    else
      # raise 'error'
    end
  end

  private

  def self.contains(value)
    value.to_s
    @@todo_list.each do |obj|
      puts obj
      #x = obj(@title).include? value
    end
   # self.all.each do |object|
    #  if object.to_h.value.match(/value/)
    #    object
    #    binding.pry
    #  else
    #    binding.pry
    #  end
    #end
  end

  def self.exactly(search)
    if self.all.each
        
    else
        raise 'Your search failed'
    end
  end
end

todo1 = Todo.new 'Remember the Milk', '10 Oct 2016'
todo2 = Todo.new 'Buy spoons', '11 Dec 2016'
todo3 = Todo.new 'Drink Milk', Date.today
Todo.todo_list(todo1)
Todo.todo_list(todo2)
Todo.todo_list(todo3)
Todo.find contains: 'Milk'
