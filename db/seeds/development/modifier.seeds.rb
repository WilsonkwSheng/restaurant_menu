after 'development:item', 'development:modifier_group' do
  topping_group = ModifierGroup.find_by(label: 'Toppings')
  sauce_group = ModifierGroup.find_by(label: 'Sauce')

  chicken_temptation_pizza = Product.find_by(label: 'Chicken Temptation')
  customizable_classic_pizza = Component.find_by(label: 'Customizable Classic Pizza')

  Modifier.find_or_create_by(label: 'Pork', item: chicken_temptation_pizza, modifier_group: topping_group) do |modifier|
    modifier.display_order = 0
    modifier.default_quantity = 1
    modifier.price_override = 2
  end

  Modifier.find_or_create_by(label: 'Beef', item: chicken_temptation_pizza, modifier_group: topping_group) do |modifier|
    modifier.display_order = 1
    modifier.default_quantity = 1
    modifier.price_override = 1
  end

  Modifier.find_or_create_by(label: 'Chicken', item: customizable_classic_pizza, modifier_group: topping_group) do |modifier|
    modifier.display_order = 0
    modifier.default_quantity = 2
    modifier.price_override = 1
  end

  Modifier.find_or_create_by(label: 'BBQ sauce', item: customizable_classic_pizza, modifier_group: sauce_group) do |modifier|
    modifier.display_order = 1
    modifier.default_quantity = 1
    modifier.price_override = 0
  end

  puts 'Successfully seeded Modifier records'
end
