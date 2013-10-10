class Vote < ActiveRecord::Base

belongs_to :question,
    inverse_of: :votes

belongs_to :user,
    inverse_of: :votes

validates :user_id, uniqueness:{ scope: :question_id }

end
