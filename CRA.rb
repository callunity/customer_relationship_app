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
    puts "[5] Display a contact's attribute"
    puts "[6] Delete a contact"
    puts "[7] Exit"
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
    when 5 then puts "Display a contact's attribute" ## replace with method
    when 6 then puts "Delete a contact" ## replace with method
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
      puts
  end

# Modify a contact
  def modify_contact
    # while true ## fix end parameter of this loop? figure out order
      puts "\e[H\e[2J"
      puts "What is the ID of the contact you would like to modify?"
      contact_id = gets.chomp.to_i
      contact_to_modify = @rolodex.search(contact_id)
      modify_menu(contact_to_modify)
      modify_contact_action(contact_to_modify)
      puts contact_to_modify.to_s
      return
    # end
  end

  def modify_menu(contact)
    puts
    puts "#{contact.to_s}" 
    puts
    puts "Would you like to modify this contact? (yes/no)"
    confirm = gets.chomp
    return unless confirm == "yes"
      ## send up to main menu if no
    puts
    puts "Which attribute would you like to modify?"
    puts "[1] First name"
    puts "[2] Last name"
    puts "[3] Email"
    puts "[4] Notes"
    puts "[5] Exit"
  end

  def modify_contact_action(contact)
    contact_attr_to_modify = gets.chomp.to_i
    case contact_attr_to_modify
    when 1
      puts "Enter new first name"
      new_first_name = gets.chomp
      contact.first_name = new_first_name
      ## undefined local variable contact_to_modify 
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
    ## figure out how to loop back to enter more values 
    ## for this contact if desired
  end

# Display all contacts 
  def display_all_contacts
    puts "\e[H\e[2J"
    @rolodex.display("all")
    carriage_return = gets.chomp
  end

# Display one contact  
  def display_one_contact
    puts "\e[H\e[2J"
    puts "What is the ID of the contact you would like to see?"
    display_id = gets.chomp.to_i
    @rolodex.display(display_id)
    carriage_return = gets.chomp
  end

end


CRM.run('My CRM')     ## toggled with self.run method
