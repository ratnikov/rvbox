class VboxConnector

  def list_vm_names
    raw_info = vbox_manage('list vms')

    names= []

    while match_data = raw_info.match(/Name:\s*([^\n]+)\n/)
      names << match_data.captures.first
      raw_info = match_data.post_match
    end
    names
  end

  def vbox_manage params
    `VBoxManage #{params}`
  end
end
