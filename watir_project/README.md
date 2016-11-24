This is a project using RSpec and Watir to automate the website Tumblr.

All of the tests are run on the command line using RSpec.

At present, the project automates a successful login and logout function as well as a successful text post.  It is set up with a before :all block to spin up a new Chrome browser and login before testing begins.

To ensure independency of tests, I have included a before :each block to check if Tumblr is logged in or not and to set the browser to a logged in dashboard page in either instance.

To improve robustness of testing, I have implemented a random uuid as both my title and my text in the text post test, meaning each test post is uniquely identifiable.  It is then tested to check that the post exists at the front end on the user's blog page.