after 'development:section', 'development:item' do
  classic_section = Section.find_by(label: 'Classics')
  seven_inch_personal_pizza_section = Section.find_by(label: '7" Personal Pizzas')

  chicken_temptation_pizza = Product.find_by(label: 'Chicken Temptation')
  SectionItem.find_or_create_by(section: classic_section, item: chicken_temptation_pizza) do |section_item|
    section_item.display_order = 0
  end

  meatzza_pizza = Product.find_by(label: 'Meatzza')
  SectionItem.find_or_create_by(section: classic_section, item: meatzza_pizza) do |section_item|
    section_item.display_order = 1
  end

  customizable_classic_pizza = Component.find_by(label: 'Customizable Classic Pizza')
  SectionItem.find_or_create_by(section: classic_section, item: customizable_classic_pizza) do |section_item|
    section_item.display_order = 2
  end

  customizable_seven_inch_personal_pizza = Component.find_by(label: 'Customizable 7" Personal Pizza')
  SectionItem.find_or_create_by(section: seven_inch_personal_pizza_section, item: customizable_seven_inch_personal_pizza) do |section_item|
    section_item.display_order = 0
  end

  puts 'Successfully seeded SectionItem records'
end
