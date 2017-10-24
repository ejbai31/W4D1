class UpdateUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :email
    change_column :users, :name, :string, uniqueness: true
    rename_column :users, :name, :username
  end
end
