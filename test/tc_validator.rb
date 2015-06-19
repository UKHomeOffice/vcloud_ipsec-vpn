require 'test/unit'
require 'methadone'
require 'nokogiri'
require 'validator'

class TestValidator < Test::Unit::TestCase
  def test_valid_yaml_returns_true
    # When I validate some valid yaml
    input_config = YAML.load_file('test/vpn-configuration-example.yaml')
    errors = Vpnconfig::Validator.new.validate_yaml(input_config)

    # Then error arrays should be empty
    assert(errors.empty?, 'There should be no errors, but the following errors were found: #{errors}')
  end

  def test_invalid_yaml_returns_false
    # When I validate some invalid yaml
    input_config = YAML.load_file('test/invalid-vpn-configuration-example.yaml')
    errors = Vpnconfig::Validator.new.validate_yaml(input_config)

    # Then relevant errors should be returned
    assert(errors[0].path == '/iShouldntBeHere', 'iShouldntBeHere key should have be identified as an error with the correct path')
    assert(errors[0].message == 'key \'iShouldntBeHere:\' is undefined.', 'iShouldntBeHere key should have be identified as an error with the correct message')
    assert(errors[1].path == '/peerSubnet', 'peerSubnet should be identified as required with the correct path')
    assert(errors[1].message == 'key \'netmask:\' is required.', 'peerSubnet should be identified as required with the correct path')
  end
end
