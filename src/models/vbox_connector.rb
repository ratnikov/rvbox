class VboxConnector
  include VmInfoParser

  def list_vm_names
    raw_info = vbox_manage('list vms')

    names= []

    while match_data = raw_info.match(/Name:\s*([^\n]+)\n/)
      names << match_data.captures.first
      raw_info = match_data.post_match
    end
    names
  end

  def lookup_vm_info vm_name
    raw_vm_info = vbox_manage("showvminfo #{vm_name}")

    if (parsed_vm = parse_vm_info raw_vm_info)[:name] == vm_name
      parsed_vm
    else
      nil
    end
  end

  def vbox_manage params
    `VBoxManage #{params}`
  end
end
