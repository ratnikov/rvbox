Symbol.class_eval do
  def to_proc
    proc { |obj| obj.send(self) }
  end
end
