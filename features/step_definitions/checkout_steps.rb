Given /^I am checking out with valid details$/ do
  add_some_products_to_cart
  checkout_with_valid_details
end

Then /^I should not be able to check out$/ do
  @page = Pages::Orders::New.new
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
    @customer = {
      :name => 'Joe Bloggs',
      :address => '1 Main St',
      :email => 'joe@example.com',
      :pay_type => 'Check'
    }
    @form.name = @customer[:name]
    @form.address = @customer[:address]
    @form.email = @customer[:email]
    @form.pay_type = @customer[:pay_type]
  end
end

World(CheckoutHelpers)
