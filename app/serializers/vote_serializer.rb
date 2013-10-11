class VoteSerializer < ActiveModel::Serializer
  embed :ids
  attributes :id
  has_one :question, key: :question
end
