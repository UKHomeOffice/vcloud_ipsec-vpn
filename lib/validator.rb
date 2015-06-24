require "vcloud_ipsec-vpn/version"
require 'kwalify'

module Vpnconfig
  class Validator
    def validate_yaml(yaml)
      schema = Kwalify::Yaml.load_file('lib/vpn-configuration-schema.yaml')
      validator = Kwalify::Validator.new(schema)
      errors = validator.validate(yaml)
      errors
    end
  end
end
