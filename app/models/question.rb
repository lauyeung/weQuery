class Question < ActiveRecord::Base
  belongs_to :user,
    inverse_of: :questions

  has_many :votes,
    inverse_of: :question,
    dependent: :destroy

  validates_presence_of :body

  state_machine initial: :asked do
    event :deliver do
      transition :asked => :sent
    end
    event :make_important do
      transition :sent => :important
    end
    event :expire do
      transition [:sent, :important, :asked] => :expired
    end

  end

  def check_state?
      check_expiration
      if self.votes.count == 7
        self.make_important!
      elsif self.votes.count == 5
        self.deliver!
      end
  end

  def active_model_serializer
    QuestionSerializer
  end

  def check_expiration
    expired = Question.where('created_at <= ?', 1.day.ago)
    expired.each do |question|
      question.expire
    end
  end
end
