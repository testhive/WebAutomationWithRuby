When /^I search Google for "(.*)"$/ do |query|
  visit 'http://www.google.com/advanced_search?hl=en'
  fill_in 'as_q', :with => query
  click_button 'Search'
end

Then /^there should be a result for "(.*)"$/ do |expected_result|
  results = all('cite').map { |el| el.text }
  p results
  results.should include expected_result
end