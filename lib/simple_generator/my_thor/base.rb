require_relative 'command'
require_relative 'create_file'
require 'erb'

class MyThor
  class << self
    def my_start(name)
      instance = new(name)
      invoke_command(instance.command, name)
    end

    def invoke_command(command, name)
      command.run(self, command, name)
    end

    def template(file_source, file_destination)
      create_file file_destination do
        content = ERB.new(IO.binread(file_source), nil, '-', '@output_buffer').tap do |erb|
          erb.filename = file_source
        end.result(binding)
        content
      end
    end

    def create_file(destination, &block)
      CreateFile.new(self, destination, block).invoke!
    end
  end
end
