after 'production:section' do
  Product.find_or_create_by(label: 'Chicken Temptation') do |item|
    item.description = '100% Mozzarella Cheese with Succulent Smoked Chicken Breast, Chicken Ham, Green and Red Pepper'
    item.price = 11.99
  end

  Product.find_or_create_by(label: 'Meatzza') do |item|
    item.description = '100% Mozzarella Cheese with Succulent Smoked Chicken Breast, Chicken Ham, Chicken Sausage, Cabanossi, Beef Pepperoni and Ground Beef'
    item.price = 12.99
  end

  Component.find_or_create_by(label: 'Customizable Classic Pizza') do |item|
    item.description = '100% Customizable Classic Pizza'
    item.price = 10.00
  end

  Component.find_or_create_by(label: 'Customizable 7" Personal Pizza') do |item|
    item.description = '100% Customizable 7" Personal Pizza'
    item.price = 10.00
  end

  puts 'Successfully seeded Item records'
end
