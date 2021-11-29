# frozen_string_literal: true

require 'httparty'

class ItBookService
  BASE_URL = 'https://api.itbook.store/1.0'

  def self.search(subject)
    response = HTTParty.get("#{BASE_URL}/search/#{subject}")
    response['books']
  end
end
