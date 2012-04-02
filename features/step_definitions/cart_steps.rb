Then /^the cart should be empty$/ do
  @page.cart.should be_empty
end

When /^I add "([^"]*)" to my cart$/ do |product_title|
  @page.add_product product_title
end

Then /^my cart should contain:$/ do |table|
  @page.cart.contents.should == table.hashes
end
