class VmInfoParser
  attr_accessor :regex, :erb_params

  def initialize options = {}
    template = options.delete(:template) || File.new(default_template , 'r').readlines.join
    setup_regex_from_template template
  end

  def setup_regex_from_template real_template
    template = real_template.dup
    regex = ""
    @erb_params = []
    while template.sub!(/^([^<%]*)<%([^%>]*)%>/, '') 
      regex += "#{Regexp.escape $1}(.*)"
      @erb_params << $2
    end
    @regex = /^#{regex}#{Regexp.escape template}$/
  end

  def parse str
     
  end

  def default_template
    File.dirname(__FILE__) + '/../templates/vm_list.template.erb'
  end
end
