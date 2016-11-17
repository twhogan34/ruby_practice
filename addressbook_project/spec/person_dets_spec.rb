describe Person do
  it 'should initialize' do
    person = Person.new 'joe', 'bloggs', '1 Jan 1990'
    expect(person.first_name).to eq 'Joe'
    expect(person.surname).to eq 'Bloggs'
    expect(person.fullname).to eq 'Joe Bloggs'
    expect(person.dob).to eq Date.parse('1 Jan 1990')
    expect(person.emails).to eq []
    expect(person.phone_numbers).to eq []
  end

  it 'should initialize with names but no date entered' do
    person = Person.new 'joe', 'bloggs'
    expect(person.first_name).to eq 'Joe'
    expect(person.surname).to eq 'Bloggs'
    expect(person.dob).to eq nil
    expect(person.emails).to eq []
    expect(person.phone_numbers).to eq []
  end

  it 'should not let us initialize with no names entered' do
    expect { Person.new }.to raise_error ArgumentError
  end

  it 'should let us change the first name given and update fullname field' do
    person = Person.new 'gary', 'bloggs'
    person.first_name = 'joe'
    expect(person.first_name).to eq 'Joe'
  end

  it 'should let us change the surname given and update fullname field' do
    person = Person.new 'joe', 'barry'
    person.surname = 'bloggs'
    expect(person.surname).to eq 'Bloggs'
  end

  it 'should let us set a date of birth and parse it into YYYY-MM-DD form' do
    person = Person.new 'joe', 'bloggs'
    person.dob = '1 Jan 1990'
    expect(person.dob).to eq Date.parse('1 Jan 1990')
  end

  it 'should let us add emails and store them in an array' do
    person = Person.new 'joe', 'bloggs'
    person.add_email 'joe@foo.com'
    person.add_email 'joe.bloggs@work.com'
    expect(person.emails).to eq ['joe@foo.com', 'joe.bloggs@work.com']
  end

  it 'should let us add phone numbers and store them as strings in an array' do
    person = Person.new 'joe', 'bloggs'
    person.add_phone '07712345678'
    person.add_phone '02012345678'
    expect(person.phone_numbers).to eq ['07712345678', '02012345678']
  end

  it 'should let us delete an email by index from the array' do
    person = Person.new 'joe', 'bloggs'
    person.add_email 'joe@foo.com'
    person.add_email 'joe.bloggs@work.com'
    person.remove_email 0
    expect(person.emails).to eq ['joe.bloggs@work.com']
  end

  it 'should let us delete a phone number by index from the array' do
    person = Person.new 'joe', 'bloggs'
    person.add_phone '07712345678'
    person.add_phone '02012345678'
    person.remove_phone 0
    expect(person.phone_numbers).to eq ['02012345678']
  end

  it 'should allow a brief description using all available details' do
    person = Person.new 'joe', 'bloggs', '1990-01-01'
    person.add_email 'joe@foo.com'
    person.add_phone '07712345678'
    person.add_phone '02012345678'
    expect(person.to_s).to eq "Joe Bloggs was born on 1990-01-01.\n Their email addresses are:
[\"joe@foo.com\"].\n Their phone numbers are [\"07712345678\", \"02012345678\"]"
  end

  it 'should allow us to display a person\'s full name' do
    person = Person.new 'joe', 'bloggs'
    expect(person.fullname).to eq 'Joe Bloggs'
  end
end
