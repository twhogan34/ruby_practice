describe Baby do
	it "should initialize" do
		bobby = Baby.new
		expect(bobby.class).to eq Baby
		expect(bobby.hair_color).to eq 'none'
		expect(bobby.top_color).to eq nil
		expect(bobby.height).to eq 0.0
		expect(bobby.smells?).to eq true
	end

	it "should smell until cleaned" do
		bobby = Baby.new
		expect(bobby.smells?).to eq true
		bobby.clean
		expect(bobby.smells?).to eq false
	end

	it "should not dance" do
		bobby = Baby.new
		expect(bobby.dance).to eq 'waaaaaaaaaa'
	end
end