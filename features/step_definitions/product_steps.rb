Given /^there are products available$/ do
  @products = [create(:product), create(:product)]
end

Then /^those products should be available to buy$/ do
  @page.product_titles.should =~ @products.collect(&:title)
end

Given /^the products:$/ do |table|
  table.raw.flatten.each do |p|
    create(:product, :title => p)
  end
end
