after 'production:item' do
  ModifierGroup.find_or_create_by(label: 'Toppings') do |modifier_group|
    modifier_group.selection_required_min = 1
    modifier_group.selection_required_max = 0
  end

  ModifierGroup.find_or_create_by(label: 'Sauce') do |modifier_group|
    modifier_group.selection_required_min = 0
    modifier_group.selection_required_max = 1
  end

  ModifierGroup.find_or_create_by(label: 'Add-ons') do |modifier_group|
    modifier_group.selection_required_min = 0
    modifier_group.selection_required_max = 0
  end

  ModifierGroup.find_or_create_by(label: 'TEST') do |modifier_group|
    modifier_group.selection_required_min = 1
    modifier_group.selection_required_max = 0
  end

  puts 'Successfully seeded ModifierGroup records'
end
