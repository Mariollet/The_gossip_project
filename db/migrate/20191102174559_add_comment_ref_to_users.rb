class AddCommentRefToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :comments, foreign_key: true
  end
end
