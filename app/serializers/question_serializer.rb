class QuestionSerializer < ActiveModel::Serializer

  embed :ids
  attributes :body, :id, :votes_count, :user_votes, :state
  has_many :votes, key: :votes
  has_one :user, key: :user

  def votes_count
    object.votes.count
  end

  def user_votes

    if current_user && object.votes.where(user_id: current_user.id).any?
      true
    else
      false
    end
  end

end
