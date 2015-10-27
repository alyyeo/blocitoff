class Item < ActiveRecord::Base
  belongs_to :user
  
  validates :name, length: { minimum: 1 }, presence: true
  
  default_scope{ order('created_at DESC') }
  
end
