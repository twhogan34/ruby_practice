describe FamilyMember do
  it 'should initialize' do
    person = FamilyMember.new 'barry', 'bloggs'
    expect(person.first_name).to eq 'Barry'
    expect(person.surname).to eq 'Bloggs'
    expect(person.fullname).to eq 'Barry Bloggs'
    expect(person.dob).to eq nil
    expect(person.emails).to eq []
    expect(person.phone_numbers).to eq []
    expect(person.relationship).to eq nil
  end

  it 'should allow us to set a family relationship value' do
    person = FamilyMember.new 'barry', 'bloggs'
    person.new_rel 'Father'
    expect(person.relationship).to eq 'Father'
  end
end
