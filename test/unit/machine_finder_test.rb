require File.dirname(__FILE__) + '/../test_helper'

class MachineFinderTest < Test::Unit::TestCase
  include MachineFinder

  def connector
    unless @connector
      connector = VboxConnector.new
      connector.extend(Module.new do
        attr_accessor :vm_names, :vm_info
        def list_vm_names; vm_names end
        def lookup_vm_info(name); vm_info[name] end
      end)
      @connector = connector
    end
    @connector
  end

  def test_truth 
    assert true
  end

  def test_find_all
    connector.vm_names = ["foo", "bar"]
    connector.vm_info = { 
      "foo" => { :name => "foo", :ostype => "Linux", :ram => "256Mb", :uuid => "asdf1" },
      "bar" => { :name => "bar", :ostype => "Windows", :ram => "1024Gb", :uuid => "hude" }
    }

    assert_equal connector.vm_info.to_a.sort_by(&:first).map(&:last).map { |hash| Machine.new hash }, find_all.sort_by(&:name)
  end
end
