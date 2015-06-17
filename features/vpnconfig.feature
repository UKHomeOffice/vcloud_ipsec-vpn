Feature: Create XML to configure a VPN

  Scenario: I should be able to get help for my app
    When I get help for "vpnconfig"
    Then the exit status should be 0
    And the banner should be present
    And there should be a one line summary of what the app does
    And the banner should include the version
    And the banner should document that this app takes options
    And the banner should document that this app's arguments are:
      |vpn_conf|

  Scenario: Happy path
    When I successfully run "vpnconfig file:///vpnconfig.yaml /tmp/vpnconfig"
    Then a valid XML file should be generated
