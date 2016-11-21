describe Todo do
  before(:each) { Todo.class_variable_set :@@todo_list, [] }

  it 'should initialize with title and date given' do
    todo = Todo.new 'Remember the Milk', Date.today
    expect(todo.class).to eq Todo
    expect(todo.title).to eq 'Remember the Milk'
    expect(todo.due_date).to eq Date.today
  end

  it 'should initialize with title but no date' do
    todo = Todo.new 'Remember the Milk'
    expect(todo.class).to eq Todo
    expect(todo.title).to eq 'Remember the Milk'
    expect(todo.due_date).to eq Date.today
  end

  it 'should not initialize without a title' do
    expect{ Todo.new }.to raise_error ArgumentError
  end

  it 'should store all todos in a class variable array' do
    todo1 = Todo.new 'Remember the Milk', Date.today
    todo2 = Todo.new 'Feed the horses'
    Todo.todo_list(todo1)
    Todo.todo_list(todo2).include?(todo1).should eq true
    Todo.todo_list(todo2).include?(todo2).should eq true
  end

  it 'should let us change the title of a todo' do
    todo = Todo.new 'Remember the Milk', Date.today
    todo.title = 'Solve world peace'
    expect(todo.title).to eq 'Solve world peace'
    expect(Todo.todo_list(todo)).to eq [todo]
  end

  it 'should let us change the due date of a todo' do
    todo = Todo.new 'Deliver all the presents to the good girls and boys', Date.today
    todo.due_date = '25 Dec 2016'
    expect(todo.due_date).to eq Date.parse('25 Dec 2016')
    expect(Todo.todo_list(todo)).to eq [todo]
  end

  it 'should allow us to return all the todos in the array' do
    todo1 = Todo.new 'Remember the Milk', Date.today
    todo2 = Todo.new 'Buy spoons', '11 Dec 2016'
    Todo.todo_list(todo1)
    Todo.todo_list(todo2)
    expect(Todo.all).to eq [todo1, todo2]
  end

=begin
  it 'should allow us to print all todos in the array' do
    expect(STDOUT).to receive(:puts).with 'To Do List'
    expect(STDOUT).to receive(:puts).with '----------'
    expect(STDOUT).to receive(:put).with 'To Do 1: Remember the Milk'
    expect(STDOUT).to receive(:put).with 'Due: 10 Oct 2016'
    expect(STDOUT).to receive(:put).with 'This To Do is overdue!'
    expect(STDOUT).to receive(:put).with ''
    expect(STDOUT).to receive(:put).with 'To Do 2: Buy spoons'
    expect(STDOUT).to receive(:put).with 'Due: 11 Dec 2016'
    todo1 = Todo.new 'Remember the Milk', '10 Oct 2016'
    todo2 = Todo.new 'Buy spoons', '11 Dec 2016'
    todo.print_all
    expect(todo.todo_list).to eq [todo1, todo2]
  end
=end

  it 'should access the most recently added todo in the array' do
    todo1 = Todo.new 'Remember the Milk', '10 Oct 2016'
    todo2 = Todo.new 'Buy spoons', '11 Dec 2016'
    Todo.todo_list(todo1)
    Todo.todo_list(todo2)
    expect(Todo.last).to eq todo2
  end

  it 'should find todos that contain a specific string in the title' do
    todo1 = Todo.new 'Remember the Milk', '10 Oct 2016'
    todo2 = Todo.new 'Buy spoons', '11 Dec 2016'
    Todo.todo_list(todo1)
    Todo.todo_list(todo2)
    expect(Todo.find contains: 'Milk').to eq [todo1]
  end
=begin
  it 'should find todos that contain a specific part of date element' do
    todo1 = Todo.new 'Remember the Milk', '10 Oct 2016'
    todo2 = Todo.new 'Buy spoons', '11 Dec 2016'
    todo3 = Todo.new 'Return stolen spoons', '12 Dec 2016'
    Todo.find contains: 'Dec'
    expect(Todo.find).to eq [todo2, todo3]
  end
=end
  it 'should find todos by exact title' do
    todo1 = Todo.new 'Remember the Milk', '10 Oct 2016'
    todo2 = Todo.new 'Buy spoons', '11 Dec 2016'
    todo3 = Todo.new 'Return stolen spoons', '12 Dec 2016'
    Todo.todo_list(todo1)
    Todo.todo_list(todo2)
    Todo.todo_list(todo3)
    expect(Todo.find exactly: 'Return stolen items').to eq [todo3]
    expect(Todo.find exactly: 'Buy').to eq []
  end
=begin
  it 'should find todos by exact date' do
    todo1 = Todo.new 'Remember the Milk', '10 Oct 2016'
    todo2 = Todo.new 'Buy spoons', '11 Dec 2016'
    todo3 = Todo.new 'Return stolen spoons', '12 Dec 2016'
    Todo.find exactly: '10 Oct 2016'
    expect(Todo.find).to eq [todo1]
  end
=end
end
