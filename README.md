# Vpnconfig
A command line tool to allow use of a yaml VPN configuration file to push this config to Skyscape

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'vpnconfig'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install vpnconfig

## Usage
Run with option --help to show command line help.

Example command line with gem installed:
vpnconfig -d DataCentre1 -u JohnSmith -w vpn-configuration.yaml

Example command line if you have cloned the repository without installing as a gem:
bundle exec ./bin/vpnconfig -d DataCentre1 -u JohnSmith -w vpn-configuration.yaml

Example yaml input:
name: MyVPNName
peerIp: 10.10.10.1
localIp: 80.10.10.1
localSubnet:
  name: LocalSubnetNameHere
  gateway: 10.80.2.0
  netmask: 255.255.255.1
peerSubnet:
  name: PeerSubnetNameHere
  gateway: 10.80.2.1
  netmask: 255.255.255.1
sharedSecret: itsasecret

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/UKHomeOffice/vcloud_ipec-vpn/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
