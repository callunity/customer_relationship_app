class Rolodex
attr_accessor :contacts


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

  def search(number)
    @contacts.select do |contact|
      if contact.id == number
        return contact
      end
    end
  end

  def search_all(attribute) ## next: regex
    @contacts.select do |contact|
      if contact.id == attribute
        puts contact.to_s
        return contact
      elsif contact.first_name == attribute
        puts contact.to_s
        return contact
      elsif contact.last_name == attribute
        puts contact.to_s
        return contact
      elsif contact.email == attribute
        puts contact.to_s
        return contact
      elsif contact.notes == attribute
        puts contact.to_s
        return contact
      else
      end
    end
  end

  def sort_by_attribute(attribute)
    case attribute
    when 1 
      @contacts.sort do |contact| 
        contact.id.each { |a, b| a <=> b } 
      puts contact
      end
    when 2
      @contacts.sort do |contact|
        contact.id.each { |a, b| a <=> b }
      puts contact.to_s
      end
    when 3
      @contacts.last_name.sort { |a, b| a <=> b }
      puts contact.to_s
    when 4
      @contacts.email.sort { |a, b| a <=> b }
      puts contact.to_s
    when 5
      @contacts.notes.sort { |a, b| a <=> b }
      puts contact.to_s
    else 
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

  def delete_contact(number) ## still not working ... 
    @contacts.delete_if { |contact| contact.id == number }
  end

end
