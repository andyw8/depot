Then /^my cart should be empty$/ do
  @page.cart.should be_empty
end

# TODO how to optionally match on 'again'?
When /^I add "([^"]*)" to my cart/ do |product_title|
  @page.add_product product_title
end

Then /^my cart should contain:$/ do |table|
  @page.cart.contents.should == table.hashes
end

Given /^my cart contains products$/ do
  @products = []
  2.times { @products << FactoryGirl.create(:product) }
  @page = Page::Store.new
  @page.visit
  @products.each do |product|
    @page.add_product product.title
  end
end

When /^I empty my cart$/ do
  @page.cart.empty!
end
