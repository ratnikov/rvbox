require File.dirname(__FILE__) + '/../test_helper'

class MachineTest < Test::Unit::TestCase
  def test_truth
    assert true
  end

  def test_primary_key
    vm = Machine.new(:name => "Test", :ostype => "Linux", :uuid => "some key")
    assert_equal vm.uuid, vm.primary_key, "Machine should return its uuid as primary key."
  end

  def test_equality
    assert_equal Machine.new(:name => "foo", :uuid => "something"), Machine.new(:name => "bar", :uuid => "something"), "Two machines should be equal if they share same uuid."
  end

  def test_hashcode
    assert_equal "something".hash, Machine.new(:name => "foo", :uuid => "something").hash, "hashcode of the machine should be the hashcode of the uuid."
  end
end
