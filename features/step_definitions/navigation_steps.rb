When /^I visit the store$/ do
  @page = Pages::Store.new
  @page.visit
end
