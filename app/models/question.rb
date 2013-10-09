class Question < ActiveRecord::Base
  belongs_to :user,
    inverse_of: :questions
  
  has_many :votes
  
  validates_presence_of :content
end
