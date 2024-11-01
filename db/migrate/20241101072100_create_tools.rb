class CreateTools < ActiveRecord::Migration[7.2]
  def change
    create_table :tools do |t|
      t.string :tool_name
      t.timestamps
    end
  end
end
