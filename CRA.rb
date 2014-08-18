require_relative('contact.rb')
require_relative('rolodex.rb')

class CRM
attr_accessor :name

  def self.run(name)     ## runs itself/all isntances of class
    crm = CRM.new(name)  ## lets you run the program with one line
    crm.main_menu        ## 
  end

  def initialize(name)
    @name = name
    @rolodex = Rolodex.new
  end

# Main menu loop
  def main_menu
    while true
      puts "\e[H\e[2J"
      print_main_menu
      input = gets.chomp.to_i
      return if input == 7
      call_option(input)
    end
  end

# Display main menu
  def print_main_menu
    puts "[1] Add a contact"
    puts "[2] Modify a contact"
    puts "[3] Display all contacts"
    puts "[4] Display one contact"
    puts "[5] Display contacts by attribute [may glitch]"
    puts "[6] Delete a contact"
    puts "[7] Exit"
    puts "[8] Search contacts"
    puts
    puts "Choose an option by entering a number:"
  end

# Run main menu options
  def call_option(input)
    case input
    when 1 
      add_contact
    when 2 
      modify_contact
    when 3 
      display_all_contacts
    when 4 
      display_one_contact
    when 5 
      sort_by
    when 6 
      delete_one_contact 
    when 8
      search_all_contacts
    else puts "Sorry, that is not an option. Please choose from one of the options listed below:"
    end
  end

# Add a contact
  def add_contact
    puts "\e[H\e[2J"
    puts "First Name"
      first_name = gets.chomp
      puts "Last Name"
      last_name = gets.chomp
      puts "Email"
      email = gets.chomp
      puts "Notes"
      notes = gets.chomp  

      contact = Contact.new(first_name, last_name, email, notes)
      @rolodex.add_contact(contact)
      puts
      puts "Added to Rolodex: \n#{contact.to_s}\n" 
      carriage_return = gets.chomp
      puts
  end

# Modify a contact
  def modify_contact
      puts "\e[H\e[2J"
      puts "What is the ID of the contact you would like to modify?"
      contact_id = gets.chomp.to_i
      contact_to_modify = @rolodex.search(contact_id)
      if contact_to_modify == nil
        puts "Contact does not exist."
        carriage_return = gets.chomp
        return
      end
      puts ""
      puts contact_to_modify.to_s ### breaking here
      puts "Would you like to modify this contact? (yes/no)"
      confirm = gets.chomp
      return unless confirm == "yes"
      modify_menu
      @rolodex.modify_contact(contact_to_modify)
      puts ""
      puts contact_to_modify.to_s
      carriage_return = gets.chomp
  end

  def modify_menu
    puts
    puts "Which attribute would you like to modify?"
    puts "[1] First name"
    puts "[2] Last name"
    puts "[3] Email"
    puts "[4] Notes"
    puts "[5] Exit"
  end

# Sort by attribute ## still not working
def sort_by
  puts "\e[H\e[2J"
  sort_menu
  sort_attribute = gets.chomp
  @rolodex.display_info_by_attribute(sort_attribute)
  carriage_return = gets.chomp
end

def sort_menu
  puts
  puts "Which attribute would you like to sort by?"
  puts "[1] Contact ID"
  puts "[2] First name"
  puts "[3] Last name"
  puts "[4] Email"
  puts "[5] Notes"
end

# Display all contacts 
  def display_all_contacts
    puts "\e[H\e[2J"
    @rolodex.display_all_contacts
    carriage_return = gets.chomp
  end

# Display one contact  
  def display_one_contact
    puts "\e[H\e[2J"
    puts "What is the ID of the contact you would like to see?"
    display_id = gets.chomp.to_i
    @rolodex.display_particular_contact(display_id)
    carriage_return = gets.chomp
  end


# Delete one contact  ## still not working
  def delete_one_contact 
    puts "\e[H\e[2J"
    puts "What is the ID of the contact you would like to delete?"
    delete_id = gets.chomp
    @rolodex.delete_contact(delete_id)
    carriage_return = gets.chomp
  end

# Search all contacts ## next: use regex for non-exact matches
  def search_all_contacts 
    puts "\e[H\e[2J"
    puts "Which contact(s) would you like to display?"
    shower_id = gets.chomp
    contacts_show = @rolodex.search_all(shower_id)
    carriage_return = gets.chomp
  end

end


CRM.run('My CRM')   
