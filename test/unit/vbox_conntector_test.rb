require File.dirname(__FILE__) + '/../test_helper'

class VboxConnectorTest < Test::Unit::TestCase

  def setup
    @connector = VboxConnector.new
    @connector.extend(Module.new do
      attr_accessor :vbox_manage_return
      def vbox_manage *args
        vbox_manage_return
      end
    end)
  end

  def test_truth
    assert true
  end

  def test_list_vm_names
    @connector.vbox_manage_return = "Name:       foo\n;aosdjgowrntbolwrngnlkmsfgb mwrkgbnsrlkgbn\nName:         Foo bar\nomg!FFSD"
    assert_equal ["foo", "Foo bar"], @connector.list_vm_names, "Should be able to parse the string to get the VM names."
  end
end
