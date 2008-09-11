require File.dirname(__FILE__) + '/../test_helper'

class VmInfoParserTest < Test::Unit::TestCase
  include VmInfoParser

  def test_parse_vm_info
    hash = parse_vm_info "Name: foo\nGuest OS: Linux \nRandom stuff: blah blah\nGuest OS: Windows XP\nMemory: 256Mb\nUUID: bfe8f6e8-da22-4005-a12d-85ed4dbc2ac5\n"
    assert_equal({ :name => "foo", :ostype => [ "Linux", "Windows XP" ], :ram => "256Mb", :uuid => "bfe8f6e8-da22-4005-a12d-85ed4dbc2ac5"}, hash, "Parsing failed...")
  end
end
