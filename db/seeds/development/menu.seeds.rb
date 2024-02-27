Menu.find_or_create_by(label: 'HRC Pizza') do |menu|
  menu.state = 'active'
  menu.start_date = Date.current
  menu.end_date = Date.current + 5.years
end

puts 'Successfully seeded Menu records'
