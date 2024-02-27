class CreateSections < ActiveRecord::Migration[7.0]
  def change
    create_table :sections do |t|
      t.string :label, null: false
      t.string :description, null: false

      t.timestamps
    end
  end
end
