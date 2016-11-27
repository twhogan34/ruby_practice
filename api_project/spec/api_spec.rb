#Authors: Luke Hargraves, Tom Hogan, and Ben Allen
#require 'pry'
describe 'Lacedeamon API' do

=begin  
  it 'should wipe the API' do
    wipe
    expect(HTTParty.get(url).to_a).to eq []
  end
 after(:each) { wipe }
=end

  it 'should post, put, patch and delete as normal' do
    norm = HTTParty.get(url).to_a
    
    a = HTTParty.post(url, body: DETAILS)
    id = a['id']
    post = HTTParty.get(url("/#{id}"))
    expect(post.check('hello', 200, 'OK')).to eq ['hello', 200, 'OK']
    
    HTTParty.put(url("/#{id}"), body: PUT_CHANGES)
    put = HTTParty.get(url("/#{id}"))
    expect(put.check('changed', 200, 'OK')).to eq ['changed', 200, 'OK']
    
    HTTParty.patch(url("/#{id}"), body: PATCH_CHANGES)
    patch = HTTParty.get(url("/#{id}"))
    expect(patch.check('new', 200, 'OK')).to eq ['new', 200, 'OK']
    
    HTTParty.delete(url("/#{id}"))
    
  #  if HTTParty.get(url).to_a) != norm
  #    warn 'WARNING! State of API changed during testing!'
      

  end

  it 'should patch the same as put (as mentioned in lesson...)' do
    norm = HTTParty.get(url).to_a
    a = HTTParty.post(url, body: DETAILS)
    id = a['id']
    post = HTTParty.get(url("/#{id}"))
    expect(post.check('hello', 200, 'OK')).to eq ['hello', 200, 'OK']
    HTTParty.put(url("/#{id}"), body: PATCH_CHANGES)
    put = HTTParty.get(url("/#{id}"))
    expect(put.check('new', 200, 'OK')).to eq ['new', 200, 'OK']
    HTTParty.delete(url("/#{id}"))
    expect(HTTParty.get(url).to_a).to eq norm
  end

  it 'should give a 404 error if todo not given a due (date)' do
    norm = HTTParty.get(url).to_a
    a = HTTParty.post(url, body: BAD_DETAILS)
    id = a['id']
    post = HTTParty.get(url("/#{id}"))
    expect(post.check(nil, 404, 'Not Found')).to eq [nil, 404, 'Not Found']
    HTTParty.delete(url("/#{id}"))
    expect(HTTParty.get(url).to_a).to eq norm
  end

  it 'should give a 404 error if todo not given a title' do
    norm = HTTParty.get(url).to_a
    a = HTTParty.post(url, body: WORSE_DETAILS)
    id = a['id']
    post = HTTParty.get(url("/#{id}"))
    expect(post.check(nil, 404, 'Not Found')).to eq [nil, 404, 'Not Found']
    HTTParty.delete(url("/#{id}"))
    expect(HTTParty.get(url).to_a).to eq norm
  end

  it 'should allow other ISO date formats' do
    norm = HTTParty.get(url).to_a
    a = HTTParty.post(url, body: BAD_DATE)
    id = a['id']
    post = HTTParty.get(url("/#{id}"))
    expect(post.check('new', 200, 'OK')).to eq ['new', 200, 'OK']
    HTTParty.delete(url("/#{id}"))
    expect(HTTParty.get(url).to_a).to eq norm
  end
end
