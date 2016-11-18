This is my main Ruby project from week 1, recapping my knowledge and creating an address book.  All code was written using TDD through use of the rspec gem.

Person_dets.rb creates a Person class through which personal data (first name, surname, dob, emails and phone numbers) can be given to instances of the class.  The data can be displayed with the to_s method and printed to the command line using the print_details method.

Fam_memb creates a FamilyMember class that inherits from person and adds an extra instance variable allowing you to set the family member's relationship.  This is very basic but was used to test our knowledge of class inheritance and how to use super.

Addrbook.rb collates all the data on an instance of Person and pushes it as a hash into an array called @store.  The list method allows the names of each person in the addressbook to be displayed in a formatted way.  The load_yaml method allows us to sidestep the Person class and populate the store array from an external yaml file and tests that the data inputs into the store array correctly.

Alongside this, I experimented with Bundler and Rake, creating a Gemfile and a Rakefile.