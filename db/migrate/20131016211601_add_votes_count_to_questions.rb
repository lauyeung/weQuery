class AddVotesCountToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :votes_count, :integer, null: false, default: 0

    Question.reset_column_information

    Question.all.each do |question|
    Question.update_counters(question.id, votes_count: question.votes.count)
    end
  end
end
