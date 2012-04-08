Then /^the order should not be placed$/ do
  Order.count.should == 0
end

Then /^the order should be placed$/ do
  sign_in_to_seller_admin
  @page = Pages::Orders::Index.new
  @page.should have(1).orders
end

Then /^the customer's details should be captured$/ do
  order = @page.orders.first
  order.name.should == @customer[:name]
  order.address.should == @customer[:address]
  order.email.should == @customer[:email]
  order.pay_type.should == @customer[:pay_type]
  # TODO can we check order contents?
end