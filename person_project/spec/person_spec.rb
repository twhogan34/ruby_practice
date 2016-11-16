describe Person do
	it "should initialize" do
		bob = Person.new 'brown', 'green', 2.0
		expect(bob.class).to eq Person
		expect(bob.hair_color).to eq 'brown'
		expect(bob.top_color).to eq 'green'
		expect(bob.height).to eq 2.0
	end

	it "should initialize" do
		bob = Person.new 'brown'
		expect(bob.class).to eq Person
		expect(bob.hair_color).to eq 'brown'
		expect(bob.top_color).to eq nil
		expect(bob.height).to eq 0.0
	end

	it "should let us set the hair color" do
		bob = Person.new 'brown'
		bob.hair_color = 'brown'
		expect(bob.hair_color).to eq 'brown'
	end

	it "should let us set the top color" do
		bob = Person.new 'brown'
		bob.top_color = 'yellow'
		expect(bob.top_color).to eq 'yellow'
	end

	it "should let us set the height" do
		bob = Person.new 'brown'
		bob.height = 6.5
		expect(bob.height).to eq 6.5
	end

	it "should be able to dance" do
		bob = Person.new 'brown'
		expect(bob.dance).to eq "I'm Dancing!"
	end

	it "should be able to sleep" do
		bob = Person.new 'brown'
		expect(bob.sleep).to eq "zzzzzzzzzz"
	end
end