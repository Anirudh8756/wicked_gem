class AddUserIdToIntrests < ActiveRecord::Migration[7.2]
  def change
    add_column :intrests, :user_id, :integer
  end
end
