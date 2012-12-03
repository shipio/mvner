module Mvner
  class Dependency < Mvner::Artifact

    mvn_attributes :type

    def initialize(node)
      @doc = node
      super
    end

    def to_s
      "Dependency: #{"type: #{type}" if type}" + super
    end
  end
end