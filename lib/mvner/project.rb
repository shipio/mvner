module Mvner
  class Project
    include Mvner::Attributes

    mvn_attributes %w(/project/ /project/parent/), [:artifact_id, :group_id, :packaging, :name]
    attr_reader :dependencies

    def initialize path
      @path = path
      @doc = ::Nokogiri::XML File.open path, 'r'
      @doc = @doc.remove_namespaces!
      @dependencies = @doc.xpath('//dependency').map{|dep| Mvner::Dependency.new(dep)}
    end

  end
end