class Machine
  attr_accessor :name, :ostype, :ram, :uuid

  def initialize options = {}
    options.each_pair do |attr_name, val|
      send("#{attr_name}=", val)
    end
  end

  def primary_key
    uuid
  end

  def eql?(other); primary_key.eql?(other.primary_key) end
  def ==(other); eql? other end
  def hash; primary_key.hash end
end
