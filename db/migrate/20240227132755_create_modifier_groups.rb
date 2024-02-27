class CreateModifierGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :modifier_groups do |t|
      t.string :label, null: false
      t.integer :selection_required_min, default: 0
      t.integer :selection_required_max, default: 0

      t.timestamps
    end
  end
end
