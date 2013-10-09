class Question < ActiveRecord::Base
  belongs_to :user,
    inverse_of: :questions

  validates_presence_of :content
end
