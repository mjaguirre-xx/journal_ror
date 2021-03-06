class Category < ApplicationRecord

  belongs_to :user, :optional => true
  has_many :journals, :dependent => :destroy

  validates :category, presence: true
  
end
