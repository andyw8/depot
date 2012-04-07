Given /^I am checking out with valid details$/ do
  add_some_products_to_cart
  checkout_with_valid_details
end

Then /^I should not be able to check out$/ do
  @page = Pages::Orders::New.new
  @page.visit
  @page.checkout_available?.should be_false
end

When /^I check out with valid details$/ do
  checkout_with_valid_details
  @form.place_order!
end

When /^I leave the (name|address|email|pay type) blank$/ do |missing_field|
  @missing_field = missing_field
  sym_for_field = "#{missing_field.gsub(' ', '_')}=".to_sym
  @form.send(sym_for_field, '') # TODO is there a nicer way of doing this?
end

When /^I attempt to place the order$/ do
  @form.place_order!
end

module CheckoutHelpers
  def checkout_with_valid_details
    @page = Pages::Store.new
    @cart = @page.cart
    @page.cart.checkout!
    @form = Pages::Orders::New.new.checkout_form
    @form.name = 'Joe Bloggs'
    @form.address = '1 Main St'
    @form.email = 'joe@example.com'
    @form.pay_type = 'Check'
  end
end

World(CheckoutHelpers)
