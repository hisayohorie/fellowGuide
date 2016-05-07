class Language < ActiveRecord::Base
  # has_and_belongs_to_many :visitors
  has_and_belongs_to_many :guides
end
