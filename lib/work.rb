#encoding: utf-8

# relish documentation

require 'ostruct'

class Work

  attr_accessor :thumbnail, :make, :model

  def initialize(args)
    args.each do |k,v|
      instance_variable_set("@#{k}", v.strip) unless v.nil?
    end
  end
end
