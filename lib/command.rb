require 'byebug'
require 'pry'
require 'thor'
require_relative 'simple_generator/generator'

module SimpleGenerator
  class Commands < Thor
    desc '创建generator', ''
    def generate(namespace, name)
      SimpleGenerator::Generators.invoke(namespace, name)
    end
  end

  Commands.start(ARGV)
end

