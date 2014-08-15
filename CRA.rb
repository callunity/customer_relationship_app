require_relative 'contact.rb'
require_relative 'rolodex.rb'

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
    when 2 then puts "Modify a contact"
    when 3 then puts "Display all contacts"
    when 4 then puts "Display one contact"
    when 5 then puts "Display a contact's attribute"
    when 6 then puts "Delete a contact"
    when 7 then puts "Exit"
    else puts "Sorry, that is not an option. Please choose from one of the options listed below"
      print_main_menu
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

      puts "Added #{contact.id} #{contact.first_name} #{contact.last_name} to Rolodex."
  end
end


CRM.run('My CRM')     ## toggled with self.run method

# As a user, if 'add' is typed, I am prompted to give my 'first name', 'last name', 
