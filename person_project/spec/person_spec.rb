describe Person do
	it "should initialize" do
		bob = Person.new # Create a new instance of the Person class, and put it in the variable
		expect(bob.class).to eq Person
		expect(bob.get_hair_color).to eq nil
		expect(bob.get_top_color).to eq nil
		expect(bob.get_height).to eq 0.0
	end

	it "should let us set the hair color" do
		bob = Person.new
		bob.set_hair_color 'brown'
		expect(bob.get_hair_color).to eq 'brown'
	end

	it "should let us set the top color" do
		bob = Person.new
		bob.set_top_color 'yellow'
		expect(bob.get_top_color).to eq 'yellow'
	end

	it "should let us set the height" do
		bob = Person.new
		bob.set_height 6.5
		expect(bob.get_height).to eq 6.5
	end

	it "should be able to dance" do
		bob = Person.new
		expect(bob.dance).to eq "I'm Dancing!"
	end

	it "should be able to sleep" do
		bob = Person.new
		expect(bob.sleep).to eq "zzzzzzzzzz"
	end
end