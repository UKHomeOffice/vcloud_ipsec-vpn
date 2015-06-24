require "vpnconfig/version"
require 'kwalify'

module Vpnconfig
  class Validator
    def validate_yaml(yaml)
      puts 'GOT HERE - 1'
      schema = Kwalify::Yaml.load_file('lib/vpn-configuration-schema.yaml')
      puts 'GOT HERE - 2'
      validator = Kwalify::Validator.new(schema)
      puts 'GOT HERE - 3'
      errors = validator.validate(yaml)
      puts 'GOT HERE - 4'
      errors
    end
  end
end
