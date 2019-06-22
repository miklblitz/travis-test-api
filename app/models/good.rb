class Good < ApplicationRecord
  validates_presence_of :name, :description, :price
  
  self.per_page  = 10
end
