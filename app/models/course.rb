class Course < ApplicationRecord
  extend Enumerize

  CATEGORIES = %i{
    math sports pets cooking
  }

  enumerize :category in: CATEGORIES
end
