class AddUserIdToTools < ActiveRecord::Migration[7.2]
  def change
    add_column :tools, :user_id, :integer
  end
end
