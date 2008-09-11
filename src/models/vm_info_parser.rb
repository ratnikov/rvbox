module VmInfoParser

  FieldParsers = {
    :name => /^Name:\s*(.+)\s*$/,
    :ostype => /^Guest OS:\s*(.+)\s*$/,
    :uuid => /^UUID:\s*(.+)\s*$/,
    :ram => /^Memory:\s*(.+)\s*$/,
  }

  def parse_vm_info raw_info
    hash = FieldParsers.to_a.inject({}) do |acc, parser_arr|
      unless (matches = raw_info.map { |line| line.match(parser_arr.last) }.compact).empty?
        val = matches.map(&:captures).map(&:first).map(&:strip)
        val = val.size == 1 ? val.first : val
        acc.merge(parser_arr.first => val)
      else
        acc
      end
    end
  end
end
