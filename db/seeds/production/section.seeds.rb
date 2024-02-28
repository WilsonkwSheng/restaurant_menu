after 'production:menu' do
  Section.find_or_create_by(label: 'Classics') do |section|
    section.description = 'A range varieties of classico pizzas'
  end

  Section.find_or_create_by(label: '7" Personal Pizzas') do |section|
    section.description = 'A range varieties of 7" personal pizzas'
  end

  puts 'Successfully seeded Section records'
end
