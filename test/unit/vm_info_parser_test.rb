require File.dirname(__FILE__) + '/../test_helper'

class VmInfoParserTest < Test::Unit::TestCase
  include VmInfoParser

  def test_parse_vm_info
    hash = parse_vm_info "Name: foo\nGuest OS: Linux \nRandom stuff: blah blah\nGuest OS: Windows XP "
    assert_equal({ :name => "foo", :ostype => [ "Linux", "Windows XP" ]}, hash, "Parsing failed...")
  end
end
