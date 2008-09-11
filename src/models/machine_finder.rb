module MachineFinder

  def setup
    @connector = VboxConnector.new
    @connector.extend(Module.new do
      attr_accessor :vbox_manage_return
      def vbox_manage *args
        vbox_manage_return
      end
    end)
  end

  def find_all

  end
end
