class CreateIntrests < ActiveRecord::Migration[7.2]
  def change
    create_table :intrests do |t|
      t.string :intrest_name
      t.timestamps
    end
  end
end
