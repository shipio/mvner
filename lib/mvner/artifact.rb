module Mvner
  class Artifact
    include Mvner::Attributes

    mvn_attributes [:artifact_id, :group_id, :version], ['', '/project/', '/project/parent/']

    def to_s
      "#{group_id}:#{artifact_id}:#{version}"
    end

  end
end