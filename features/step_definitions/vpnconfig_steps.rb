# Put your step definitions here
require 'nokogiri'

Then(/^a valid XML file should be generated$/) do
  puts '-----------------------'
  puts '-----------------------'
  puts '-----------------------'
  puts '-----------------------'
  puts Dir.glob("*")
  expected_file = File.open("features/expected-vpn-config.xml")
  expected_content = Nokogiri::XML(expected_file)
  expected_file.close

  actual_file = File.open("/tmp/vpnconfig/vpn-config.xml")
  actual_content = Nokogiri::XML(actual_file)
  actual_file.close

  test1 = actual_content.to_xml
  test2 = expected_content.to_xml


  puts '-------------- ACTUAL FILE IS -----------------------'
  puts '-------------- ACTUAL FILE IS -----------------------'
  puts test1
  puts '-------------- EXPECTED FILE IS -----------------------'
  puts '-------------- EXPECTED FILE IS -----------------------'
  puts test2
  test1.should == test2
end
