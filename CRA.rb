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

# Display main menu
  def print_main_menu
    puts "[1] Add a contact"
    puts "[2] Modify a contact"
    puts "[3] Display all contacts"
    puts "[4] Display one contact"
    puts "[5] Display a contact's attribute"
    puts "[6] Delete a contact"
    puts "[7] Exit"
    puts "Choose an option by entering a number:"
  end

# Main menu loop
  def main_menu
    while true
      print_main_menu
      input = gets.chomp.to_i
      return if input == 7
      call_option(input)
    end
  end

# Run main menu options
  def call_option(input)
    case input
    when 1 
      add_contact
    when 2 
      modify_contact
    when 3 then puts "Display all contacts"
    when 4 then puts "Display one contact"
    when 5 then puts "Display a contact's attribute"
    when 6 then puts "Delete a contact"
    when 7 then puts "Exit"
    else puts "Sorry, that is not an option. Please choose from one of the options listed below:"
    end
  end

# Add a contact
  def add_contact
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

      puts "Added to Rolodex: \n#{contact.contact_display}\n"
  end

# Modify a contact
  def modify_contact
    while true
      puts "What is the ID of the contact you would like to modify?"
      contact_id = gets.chomp
      contact_to_modify = @rolodex.search(contact_id)
    # if false main_menu  ## don't want it to call self, so what?
      modify_menu(contact_to_modify) ## display breaks here
      contact_attr_to_modify = gets.chomp.to_i
      modify_contact_action(contact_attr_to_modify)
      puts contact_to_modify.contact_display
    end
  end

  def modify_menu(contact)
    puts "#{contact.contact_display}"
    puts "Would you like to modify this contact? (yes/no)"
    confirm = gets.chomp
    return unless confirm == "yes"
      
   
    puts "Which attribute would you like to modify?"
    puts "[1] First name"
    puts "[2] Last name"
    puts "[3] Email"
    puts "[4] Notes"
    puts "[5] Exit"

  end

  def modify_contact_action(input)
    case input
    when 1
      puts "Enter new first name"
      new_first_name = gets.chomp
      contact_to_modify.first_name = new_first_name
    when 2
      puts "Enter new last name"
      new_last_name = gets.chomp
      contact_to_modify.last_name = new_last_name
    when 3
      puts "Enter new email"
      new_email = gets.chomp
      contact_to_modify.email = new_email
    when 4
      puts "Enter new note"
      new_notes = gets.chomp
      contact_to_modify.notes = new_notes
    when 5 
      return
    else puts "Sorry, that is not an option."
    end
  end

end


CRM.run('My CRM')     ## toggled with self.run method
