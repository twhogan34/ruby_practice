describe 'arithmetic machine' do
	it "should add two numbers" do
		expect(add_numbers(5,6)).to eq 11
	end

	it "should subtract two numbers" do
		expect(sub_numbers(9,2)).to eq 7
	end
=begin
	it "should add an array of numbers" do
		expect(add_array_numbers([5,6,10])).to eq 21
	end

	it "should add an array of numbers" do
		expect(add_array_numbers([])).to eq 0
	end
=end
end