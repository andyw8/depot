When /^I visit the store$/ do
  @page = Page::Store.new
  @page.visit
end
