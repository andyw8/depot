Given /^there are products available$/ do
  @products = [FactoryGirl.create(:product), FactoryGirl.create(:product)]
end

Then /^those products should be available to buy$/ do
  @page.product_titles.should =~ @products.collect(&:title)
end
