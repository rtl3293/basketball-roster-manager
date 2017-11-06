class AddUsernameAndPasswordToCoaches < ActiveRecord::Migration
  def change
    add_column :coaches, :username, :string
    add_column :coaches, :password_digest, :string
  end
end
