Then /^the order should not be placed$/ do
  Order.count.should == 0
end

Then /^the order should be placed$/ do
  Order.count.should == 1
end