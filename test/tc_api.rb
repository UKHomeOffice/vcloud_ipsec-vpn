require 'test/unit'
require 'methadone'
require 'nokogiri'
require 'api'
require 'diffy'

class TestApi < Test::Unit::TestCase
  def test_get_task_href
    #Given I have a body of xml
    f = File.open("test/vpn-post-response.xml")
    body = Nokogiri::XML(f).to_xml
    f.close

    #When I get_task_href
    task_href = Vpnconfig::Api.new.get_task_href(body)

    #I will be returned the href for the task
    expected_task_href = 'taskHref'
    assert(task_href == expected_task_href, 'task href was not retrieved successfully')
  end
end
