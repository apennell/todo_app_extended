class AddAgeToAuthor < ActiveRecord::Migration
  def change
    add_column :authors, :age, :integer
  end
end
