class AddBioToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :bio, :text
    add_column :users, :age, :integer
    add_column :users, :email, :string
  end
end
