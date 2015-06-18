require 'test/unit'
require 'methadone'
require 'nokogiri'
require 'generator'

class TestSomething < Test::Unit::TestCase
  def test_xml_generation
    # When I generate some XML
    puts Dir.glob('*')
    input_config = YAML.load_file('test/vpn-configuration-example.yaml')
    generated_xml = Vpnconfig::Generator.new.generate_xml(input_config, '/tmp/vpnconfig/')

    # Then a valid XML file should be generated
    expected_file = File.open("test/expected-vpn-config.xml")
    expected_content = Nokogiri::XML(expected_file).to_xml
    expected_file.close

    # actual_file = File.open("/tmp/vpnconfig/vpn-config.xml")
    # actual_content = Nokogiri::XML(actual_file).to_xml
    # actual_file.close

    puts generated_xml == expected_content
    assert (generated_xml == expected_content)
  end
end
