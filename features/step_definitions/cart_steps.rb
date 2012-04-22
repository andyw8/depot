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
  add_some_products_to_cart
end

Given /^my cart is empty$/ do
  # no-op
end

When /^I empty my cart$/ do
  @page.cart.empty!
end

def add_some_products_to_cart
  @products = []
  2.times { @products << create(:product) }
  @page = Pages::Store.visit
  @products.each do |product|
    @page.add_product product.title
  end
end