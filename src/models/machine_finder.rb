module MachineFinder

  def connector
    @connector ||= VboxConnector.new
    @connector
  end

  def find_all
    connector.list_vm_uuids.map { |vm_name| connector.lookup_vm_info_by_uuid vm_name }.compact.map { |vm_hash| Machine.new vm_hash }
  end
end
