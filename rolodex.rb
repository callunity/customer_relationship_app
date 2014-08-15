class Rolodex
attr_reader :contacts

  def initialize
	  @contacts = []
    @index = 1000
  end

  def add_contact(contact)
    contact.id = @index
    @contacts << contact
    @index += 1
    contact
  end

  def search(query)
    @contacts.each do |contact|
      if contact.id == query
        return contact
      else return true
        puts "Contact does not exist.\n"
      end
    end
  end

  def display(number)
    if number == "all"
      @contacts.each do |contact|
        puts contact
      end
    else @contacts.each do |contact|
          if contact.id == number
            puts contact
          end
      end
    end
  end

end






# contact_display broken: inverse order in CRA.rb/69
# (ie. #{contact} \n Added to Rolodex:) and doesn't run 
# at all in modify_contact/78


## how do I "bump" out of a branch if a certain condition
## is met? (modify_menu if no — want to return 
## to modify_contact)