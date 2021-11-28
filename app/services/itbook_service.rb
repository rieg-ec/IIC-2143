# frozen_string_literal: true

require 'httparty'

class ItBook
  include HTTParty
  base_uri 'api.itbook.store'

  def initialize(service, page)
    @options = { query: { site: service, page: page } }
  end

  def find_books(query)
    books = self.class.get("/1.0/search/#{query}", @options)
    books['books']
  end
end

# it_book = ItBook.new('itbook', 1)

# puts it_book.find_books("python")
