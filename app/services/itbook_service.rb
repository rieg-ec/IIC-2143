require 'httparty'
# Use the class methods to get down to business quickly
response = HTTParty.get('https://api.itbook.store/1.0/')

# Or wrap things up in your own class
class ItBook
  include HTTParty
  base_uri 'api.itbook.store'

  def initialize(service, page)
    @options = { query: { site: service, page: page } }
  end

  def findBooks(query)
    books = self.class.get("/1.0/search/#{query}", @options)
    return books["books"]
  end

end

it_book = ItBook.new("itbook", 1)

# puts it_book.findBooks("python")