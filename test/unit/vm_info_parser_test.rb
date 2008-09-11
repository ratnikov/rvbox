require File.dirname(__FILE__) + '/../test_helper'

class VmInfoParserTest < Test::Unit::TestCase

  def setup
    @parser = VmInfoParser.new 
  end

  def test_truth
    assert true
  end

  def test_setup_regex_from_template
    template = "foo: <% foo %>\nbar: <% bar %>"
    @parser.setup_regex_from_template template

    assert_equal [" foo ", " bar "], @parser.erb_params, "The erb params should match the ones from the template."
    assert_not_nil @parser.regex, "@parser should have regex set."

    match_data = template.match @parser.regex
    assert_not_nil match_data, "template #{template.inspect} should match the parser's new regex #{@parser.regex.inspect}."
    @parser.erb_params.each_index do |i_param|
      assert_equal match_data.captures[i_param], "<%#{@parser.erb_params[i_param]}%>", "Capture group #{i_param} is incorrect."
    end
  end
end
