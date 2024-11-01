class AddUserIdToPersonalInformation < ActiveRecord::Migration[7.2]
  def change
    add_column :personal_informations, :user_id, :integer
  end
end
