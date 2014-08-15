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
      else puts "Contact does not exist.\n"
        return true
      end
    end
  end

  def display(number)
    if number == "all"
      @contacts.map do |contact|
        puts contact
      end
    elsif @contacts.map do |contact|
          if contact.id == number
            puts contact
          end
        end
    else puts "What's happening??"
    end
  end

end






# fix "return if" line in main_menu


## how do I "bump" out of a branch if a certain condition
## is met? (modify_menu if no — want to return 
## to modify_contact)