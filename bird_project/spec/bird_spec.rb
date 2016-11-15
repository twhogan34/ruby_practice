describe Bird do
	it "should initialize " do
		eclectus = Bird.new
		expect(eclectus.class).to eq Bird
		expect(eclectus.get_color).to eq nil
		expect(eclectus.get_type).to eq nil
		expect(eclectus.get_spotted?).to eq false
		expect(eclectus.get_can_fly?).to eq false
		expect(eclectus.get_length).to eq 0.0
	end

	it "should let us set the bird color" do
		eclectus = Bird.new
		eclectus.set_color 'green and red'
		expect(eclectus.get_color).to eq 'green and red'
	end

	it "should let us set the bird type" do
		eclectus = Bird.new
		eclectus.set_type 'parrot'
		expect(eclectus.get_type).to eq 'parrot'
	end

	it "should let us set the date the bird was spotted on" do
		eclectus = Bird.new
		eclectus.set_spotted? true
		expect(eclectus.get_spotted?).to eq '16/04/2014'
		eclectus.set_spotted? false
		expect(eclectus.get_spotted?).to eq 'Unspotted'
	end

	it "should let us set if the bird can fly or not" do
		eclectus = Bird.new
		eclectus.set_can_fly? true
		expect(eclectus.get_can_fly?).to eq 'I can fly!'
		eclectus.set_can_fly? false
		expect(eclectus.get_can_fly?).to eq 'Sadly I am grounded :('
	end

	it "should let us set the bird length" do
		eclectus = Bird.new
		eclectus.set_length 31.75
		expect(eclectus.get_length).to eq 31.75
	end

	it "should be able to chirp" do
		eclectus = Bird.new
		expect(eclectus.chirp).to eq 'Pretty Polly'
	end

	it "should be able to fly if it can fly" do
		eclectus = Bird.new
		eclectus.set_can_fly? true
		expect(eclectus.fly).to eq 'Let\'s fly away!'
	end

	it "should waddle if it can't fly" do
		eclectus = Bird.new
		eclectus.set_can_fly? false
		expect(eclectus.waddle).to eq 'Sadly I can\'t fly, I have to waddle!'
	end

	it "should be able to peck" do
		eclectus = Bird.new
		expect(eclectus.peck).to eq 'Hey! That\'s my food! Keep off!'
	end

	it "should be able to describe each bird in full" do
		eclectus = Bird.new
		eclectus.get_type
		eclectus.get_spotted?
		eclectus.get_color
		eclectus.get_length
		eclectus.get_can_fly?
		eclectus.chirp
		expect(eclectus.description).to eq "I am a parrot, I was first spotted on 16/04/2014, I am green and red, I'm 31.75cm long, I can fly and I love to say 'Pretty Polly'"
	end
end