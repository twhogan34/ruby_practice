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
    expect(book.store).to eq [
      { fullname: 'Joe Bloggs', dob: '1990-01-01' },
      { fullname: 'Andy Nother', dob: '1995-01-02' }
    ]
  end

  it 'should be able to print an addressbook entry list' do
    expect(STDOUT)
    book = AddressBook.new
    person1 = Person.new('joe', 'bloggs', '1 Jan 1990')
    person2 = Person.new('andy', 'nother', '2 Jan 1995')
    book.add person1
    book.add person2
    end
end
