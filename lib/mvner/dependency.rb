module Mvner
  class Dependency
    include Mvner::Attributes

    mvn_attributes '', [:group_id, :artifact_id, :version, :type]

    def initialize(node)
      @doc = node
    end
  end
end