require "vcloud_ipsec-vpn/version"

module Vpnconfig
  class Generator
  def generate_xml(input_configs)

      xml = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') do |xml|
        xml.EdgeGatewayServiceConfiguration('xmlns' => 'http://www.vmware.com/vcloud/v1.5') {
          xml.GatewayIpsecVpnService {
            xml.IsEnabled true
            input_configs.each do |input_config|
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
                xml.Mtu input_config.fetch('mtu', '1500')
                xml.IsEnabled 'true'
                xml.IsOperational 'false'
              }
          end
        }
      }
      end

      xml.to_xml
    end
  end
end
