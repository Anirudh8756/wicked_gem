class CreatePersonalInformations < ActiveRecord::Migration[7.2]
  def change
    create_table :personal_informations do |t|
      t.string :name
      t.string :email
      t.string :contact_no
      t.text :address
      t.timestamps
    end
  end
end
