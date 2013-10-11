class QuestionSerializer < ActiveModel::Serializer
  embed :ids
  attributes :id, :content, :state
  # has_one :user
  has_many :votes, key: :votes

end
