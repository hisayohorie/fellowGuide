class Language < ActiveRecord::Base
  # has_and_belongs_to_many :visitors

  validates :lang, presence:true
  has_and_belongs_to_many :guides
end
