module Mvner
  class Project < Mvner::Artifact

    mvn_attributes [:packaging, :name],'/project/'

    attr_reader :dependencies, :modules

    def initialize path
      @path = path
      @doc = ::Nokogiri::XML File.open path, 'r'
      @doc = @doc.remove_namespaces!
      @modules = parent? ? modules_by_path : {}
      @dependencies = @doc.xpath('//dependency').map{|dep| Mvner::Dependency.new(dep)}
    end

    def parent?
      module_nodes.length > 0
    end

    def to_s
      "Project: " + super
    end

    private

    def modules_by_path
      @modules_by_path ||= ::HashWithIndifferentAccess[module_nodes.map{ |node|
         [node.content, Mvner::Project.new(File.join(File.dirname(@path), node.content, "pom.xml"))]
      }]
    end

    def module_nodes
      @module_nodes ||= @doc.xpath('/project/modules/module')
    end

  end
end