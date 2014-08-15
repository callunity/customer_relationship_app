class Rolodex

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
end