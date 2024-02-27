class CreateModifiers < ActiveRecord::Migration[7.0]
  def change
    create_table :modifiers do |t|
      t.references :item, null: false, foreign_key: true
      t.references :modifier_group, null: false, foreign_key: true
      t.string :label, null: false
      t.integer :display_order, null: false, default: 0
      t.integer :default_quantity, null: false, default: 0
      t.float :price_override, null: false, default: 0

      t.timestamps
    end
  end
end
