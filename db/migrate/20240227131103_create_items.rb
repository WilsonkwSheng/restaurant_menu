class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :label, null: false
      t.string :description, null: false
      t.float :price, null: false, default: 0.0
      t.string :type, null: false

      t.timestamps
    end
  end
end
