describe 'arithmetic machine' do
	it "should add two numbers" do
		expect(add_numbers(5,6)).to eq 11
	end

	it "should subtract two numbers" do
		expect(sub_numbers(9,2)).to eq 7
	end

	it "should add an array of numbers" do
		expect(add_array_numbers([5,6,10])).to eq 21
	end

	it "should add an array of numbers" do
		expect(add_array_numbers([])).to eq 0
	end

	it "should multiply two numbers" do
		expect(mult_numbers(7,5)).to eq 35
	end

	it "should multiply all numbers in an array" do
		expect(mult_array([5,2,4])).to eq 40
	end

	it "should divide two numbers and return a float" do
		expect(div_numbers(10,2)).to eq 5
		expect(div_numbers(9,2)).to eq 4.5
	end
=begin
	it "should raise one number to the power of another"

	it "should take one number and return its factorial"
=end
end