require "vpnconfig/version"

module Vpnconfig
  class Generator
  def generate_xml(input_config)
      xml = Nokogiri::XML::Builder.new do |xml|
        xml.GatewayIpsecVpnService {
          xml.IsEnabled true
          xml.Tunnel {
            xml.Name input_config['name']
            xml.Description
            xml.IpsecVpnThirdPartyPeer {
              xml.PeerId input_config['peerIp']
            }
            xml.PeerIpAddress input_config['peerIp']
            xml.PeerId input_config['peerIp']
            xml.LocalIpAddress input_config['localIp']
            xml.LocalId input_config['localIp']
            xml.LocalSubnet {
              xml.Name input_config['localSubnet']['name']
              xml.Gateway input_config['localSubnet']['gateway']
              xml.Netmask input_config['localSubnet']['netmask']
            }
            xml.PeerSubnet {
              xml.Name input_config['peerSubnet']['name']
              xml.Gateway input_config['peerSubnet']['gateway']
              xml.Netmask input_config['peerSubnet']['netmask']
            }
            xml.SharedSecret input_config['sharedSecret']
            xml.SharedSecretEncrypted false
            xml.EncryptionProtocol 'AES256'
            xml.Mtu '1500'
            xml.IsEnabled 'true'
            xml.IsOperational 'false'
          }
        }
      end

      xml.to_xml
    end
  end
end
