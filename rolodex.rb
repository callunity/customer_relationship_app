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
    @contacts.select do |contact|
      if contact.id == query
        return contact
      else puts "Contact does not exist.\n"
        return true
      end
    end
  end

  def modify_contact(contact)
    contact_attr_to_modify = gets.chomp.to_i
    puts ""
    case contact_attr_to_modify
    when 1
      puts "Enter new first name"
      new_first_name = gets.chomp
      contact.first_name = new_first_name
    when 2
      puts "Enter new last name"
      new_last_name = gets.chomp
      contact.last_name = new_last_name
    when 3
      puts "Enter new email"
      new_email = gets.chomp
      contact.email = new_email
    when 4
      puts "Enter new note"
      new_notes = gets.chomp
      contact.notes = new_notes
    when 5 
      return
    else puts "Sorry, that is not an option."
    end
  end

  def display_particular_contact(number)
    @contacts.map do |contact|
      puts contact if contact.id == number
    end
  end

  def display_all_contacts
    @contacts.map do |contact|
      puts contact
      puts
    end
  end

end






# fix "return if" line in main_menu


## how do I "bump" out of a branch if a certain condition
## is met? (modify_menu if no — want to return 
## to modify_contact)