# The product list will break if there isn't at least one product
Before('@product') do |scenario|
  create(:product)
end

After do |scenario|
  save_and_open_page if scenario.status == :failed && '1' == ENV['LAUNCHY']
end
