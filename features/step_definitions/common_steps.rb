#encoding: UTF-8

Given(/^I post a pet info into petstore$/) do |table|
  # table is a table.hashes.keys # => [:id, :125]
  values = Hash[table.raw]
  response = RestClient.post 'http://petstore.swagger.io/v2/pet',
                  {
                      "id" => values['id'].to_i,
                      "category"=> {
                        "id" => 4,
                        "name"=> "category1"
                      },
                        "name"=> values['name'],
                        "photoUrls"=> [
                          "string"
                        ],
                        "tags"=> [
                          {
                            "id"=> 0,
                            "name"=> "string"
                          }
                        ],
                        "status"=> "available"
  }.to_json, :content_type => :json
  p response.code
end

When(/^I retrieve the pet with this data from petstore$/) do |table|
  # table is a table.hashes.keys # => [:id, :125]
  values = Hash[table.raw]
  id = values['id'] if values['id']
  id.should_not be nil

  begin
    response = RestClient.get "http://petstore.swagger.io/v2/pet/#{id}",:accept => "application/json"
    $clean_resp = JSON.parse response
    p $clean_resp
  rescue => e
    p JSON.parse e.response
  end
end

Then(/^Data should match the following from petstore$/) do |table|
  # table is a table.hashes.keys # => [:name, :doggy]
  values = Hash[table.raw]
  values.keys.each { |x|
    values[x].should == $clean_resp[x]
  }
end


Given(/^I insert these values into MySQL$/) do |table|
  # table is a table.hashes.keys # => [:id, :126]
  values = Hash[table.raw]
  no = values['number']
  name = values['name']
  surname = values['surname']
  address = values['address'] if values["address"]
  if address == nil then address = '' end
  con = Mysql.new('localhost', 'root', '123456', 'test')
  con.query "insert into testhive (number, name, surname, address) values (#{no.to_i}, '#{name}', '#{surname}', '#{address}')"
  con.close
end

When(/^I retrieve the data from MySQL$/) do |table|
  # table is a table.hashes.keys # => [:id, :126]
  values = Hash[table.raw]
  number = values['number']
  con = Mysql.new('localhost', 'root', '123456', 'test')
  rs = con.query("select * from testhive where number=#{number}")
  $select_result = Array.new
  rs.each_hash { |h| $select_result.push h}
  con.close
end

Then(/^Data should match the following from MySQL$/) do |table|
  # table is a table.hashes.keys # => [:name, :catty]
  values = Hash[table.raw]
  result = $select_result.first
  values.each{|x| result[x].should == values[x] }
end

Given(/^I insert these values into Mongo$/) do |table|
  # table is a table.hashes.keys # => [:number, :127]
  values = Hash[table.raw]
  db = MongoClient.new("127.0.0.1", 27017).db("local")
  coll = db.collection("testhive")
  doc = {
      'number' => values['number'].to_i,
      'name' => values['name'],
      'surname' => values['surname']
  }
  coll.insert doc
end

When(/^I retrieve the data from Mongo$/) do |table|
  # table is a table.hashes.keys # => [:number, :127]
  values = Hash[table.raw]
  db = MongoClient.new("127.0.0.1", 27017).db("local")
  coll = db.collection("testhive")
  $document = coll.find("number" => values['number'].to_i).to_a.first
end

Then(/^Data should match the following from Mongo$/) do |table|
  # table is a table.hashes.keys # => [:name, :alper]
  values = Hash[table.raw]
  values.keys.each { |x| values[x].should == $document[x] }
end

Given(/^I read file with name "([^"]*)"$/) do |file_name|
  Spreadsheet.client_encoding = 'UTF-8'
  book = Spreadsheet.open file_name
  sheet1 = book.worksheet 'Sheet1'
  sheet1.each do |row|
    p row.to_a
  end
end