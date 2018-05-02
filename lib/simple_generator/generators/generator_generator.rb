require_relative 'base'

module SimpleGenerator
  module Generators
    class GeneratorGenerator < Base
      class << self
        attr_accessor :file_name, :class_name
      end

      def initialize(name)
        self.class.file_name = name
        self.class.class_name = name
        super(name)
      end

      def command
        Command.new('create_generator_files')
      end

      def self.create_generator_files(name)
        lookup = File.join('simple_generator/source/', '**')

        file_destination = File.join('simple_generator/destination')

        files(lookup).each do |file_source|
          file_destination = File.join('simple_generator/destination', file_source.gsub('simple_generator/source', '.'))
          file_destination.gsub!('/./', '/')

          template(file_source, file_destination)
        end
      end

      def self.files(lookup)
        Dir[lookup]
      end
    end
  end
end
