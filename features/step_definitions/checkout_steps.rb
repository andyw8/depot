Given /^I am checking out with valid details$/ do
  add_some_products_to_cart
  checkout_with_valid_details
end

Then /^I should not be able to check out$/ do
  @page.checkout_available?.should be_false
end

When /^I check out with valid details$/ do
  checkout_with_valid_details
end

When /^I leave the (name|address|email|pay type) blank$/ do |field|
  @form.fields[field] = ''
end

When /^I attempt to place the order$/ do
  @form.place_order
end

Given /^I fill in an invalid email address$/ do
  @form.email = 'joe%example.org'
end

def checkout_with_valid_details
  @page = Pages::Store.new
  @cart = @page.cart
  @page.cart.checkout!
  @form = Pages::Orders::New.new.checkout_form
  @form.name = 'Joe Bloggs'
  @form.address = '1 Main St'
  @form.email = 'joe@example.com'
  @form.pay_type = 'Check'
  @form.place_order!
end
