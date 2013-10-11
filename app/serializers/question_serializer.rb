class QuestionSerializer < ActiveModel::Serializer
  embed :ids, include: :true
  attributes :id, :body, :state
  # has_one :user
  has_many :votes, key: :votes

end
