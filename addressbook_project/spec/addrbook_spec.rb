describe AddressBook do
  it 'should initialize' do
    book = AddressBook.new
    expect(book.store).to eq []
  end

  it 'should allow people to be added to the addressbook' do
    book = AddressBook.new
    person1 = Person.new('joe', 'bloggs', '1 Jan 1990')
    person2 = Person.new('andy', 'nother', '2 Jan 1995')
    book.add person1
    book.add person2
    expect(book.store).to eq [ person1, person2 ]
  end

  it 'should be able to print an addressbook entry list' do
    expect(STDOUT).to receive(:puts).with 'Address Book'
    expect(STDOUT).to receive(:puts).with '------------'
    expect(STDOUT).to receive(:puts).with 'Entry 1: Joe Bloggs'
    expect(STDOUT).to receive(:puts).with 'Entry 2: Andy Nother'
    book = AddressBook.new
    person1 = Person.new('joe', 'bloggs', '1 Jan 1990')
    person2 = Person.new('andy', 'nother', '2 Jan 1995')
    book.add person1
    book.add person2
    book.list
  end

  it 'should load data from a yaml file into the addressbook' do
    person1 = Person.new 'Tom', 'Hogan', '04 Mar 1992'
    person2 = Person.new 'Harnish', 'Vora', '22 Apr 1991'
    person1.add_email 'thogan@spartaglobal.co'
    person1.add_email 'twhogan34@gmail.com'
    person2.add_email 'hvora22@googlemail.com'
    person2.add_email 'hvora@spartaglobal.co'
    person1.add_phone '07786438120'
    person2.add_phone '07907208789'

    book = AddressBook.new
    book.load_yaml './addrbook_testdata.yml'
    expect(book.store).to eq [ person1, person2 ]
  end
end
