# Put your step definitions here

Then(/^a valid XML file should be generated$/) do
  expected_file = File.open("features/expected-vpn-config-xml.xml")
  expected_content = expected_file.read

  actual_file = File.open("/tmp/vpnconfig/vpn-config-xml.xml")
  actual_content = actual_file.read

  assert(actual_content == expected_content, "The XML file was not generated as expected")
end
