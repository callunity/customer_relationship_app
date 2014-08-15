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
      end
  end
end
end