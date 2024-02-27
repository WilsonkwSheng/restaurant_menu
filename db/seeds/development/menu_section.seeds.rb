after 'development:menu', 'development:section' do
  menu = Menu.find_by(label: 'HRC Pizza')

  classic_section = Section.find_by(label: 'Classics')
  MenuSection.find_or_create_by(menu: menu, section: classic_section) do |menu_section|
    menu_section.display_order = 0
  end

  seven_inch_personal_pizza_section = Section.find_by(label: '7" Personal Pizzas')
  MenuSection.find_or_create_by(menu: menu, section: seven_inch_personal_pizza_section) do |menu_section|
    menu_section.display_order = 1
  end

  puts 'Successfully seeded MenuSection records'
end
