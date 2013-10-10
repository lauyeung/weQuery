class AddStateToQuestions < ActiveRecord::Migration
  def up
    add_column :questions, :state, :string
  end
  def down
    remove_column :questions, :state
  end
end
