class AddBookIdToBookComments < ActiveRecord::Migration[8.0]
  def change
    add_reference :book_comments, :book, null: false, foreign_key: true
  end
end
