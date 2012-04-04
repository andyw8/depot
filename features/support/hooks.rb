Before('@product') do |scenario|
  FactoryGirl.create(:product)
end

After do |scenario|
  save_and_open_page if scenario.status == :failed && '1' == ENV['LAUNCHY']
end
