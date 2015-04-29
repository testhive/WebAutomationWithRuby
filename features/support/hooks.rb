#encoding: UTF-8
After do |scenario|
  if scenario.failed?
    p "scenario failed"
  end
end

Before('@first') do |scenario|
  p "#{scenario.name} starting"
end

Around('@testhive') do |scenario, block|
  p 'testhive starting'
  block.call
  p 'testhive ending'
end

Before('@setup') do
  $search_term = 'alpler'
end

After('@teardown') do
  $search_term = nil
end