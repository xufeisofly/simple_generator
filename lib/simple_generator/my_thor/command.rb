class MyThor
  class Command < Struct.new(:name)
    def initialize(name)
      super(name.to_s)
    end

    def run(instance, command, name)
      instance.__send__(command.name, name)
    end
  end
end
