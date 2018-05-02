require_relative 'generators/generator_generator'

module SimpleGenerator
  module Generators
    class << self
      def invoke(namespace, name)
        puts 'step1: generator.invoke'
        klass = find_by_namespace(namespace)
        klass.my_start(name)
      end

      def find_by_namespace(namespace)
        SimpleGenerator::Generators::GeneratorGenerator
      end
    end
  end
end
