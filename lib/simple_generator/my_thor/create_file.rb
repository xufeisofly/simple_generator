class MyThor
  class CreateFile
    attr_reader :data, :destination, :base

    def initialize(base, destination, data)
      @base = base
      @data = data
      @destination = absolute_destination(destination)
    end

    def render
      data.call
    end

    def invoke!
      File.open(destination, 'wb') { |f| f.write render }
      puts 'create ' + destination
    end

    def absolute_destination(destination)
      destination.gsub!(/%(.*?)%/, base.__send__(:file_name))
      File.join(Dir.pwd, destination)
    end
  end
end
