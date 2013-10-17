class ChangeQuestionColumnToBody < ActiveRecord::Migration
  def up
    rename_column :questions, :content, :body
  end

  def down
    rename_column :questions, :body, :content
  end
end
