class AddUserIdToBookComments < ActiveRecord::Migration[8.0]
  def change
    add_reference :book_comments, :user, null: false, foreign_key: true
  end
end
