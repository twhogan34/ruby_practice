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
    expect(book.store).to eq [person1, person2]
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
    book = AddressBook.new
    book.load_yaml './addrbook_testdata.yml'
    expect(book.store[0].first_name).to eq 'Tom'
    expect(book.store[0].surname).to eq 'Hogan'
    expect(book.store[0].dob).to eq Date.parse('04 Mar 1992')
    expect(book.store[0].emails[0]).to eq 'thogan@spartaglobal.co'
    expect(book.store[0].phone_numbers[0]).to eq '07786438120'
  end
end
