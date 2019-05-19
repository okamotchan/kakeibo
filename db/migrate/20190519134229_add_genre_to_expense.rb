class AddGenreToExpense < ActiveRecord::Migration[5.2]
  def change
    add_column :expenses, :genre, :string
  end
end
