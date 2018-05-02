require_relative '../my_thor/base'

module SimpleGenerator
  module Generators
    class Base < MyThor
      attr_reader :name

      def initialize(name)
        @name = name
      end
    end
  end
end
