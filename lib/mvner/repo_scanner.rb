module Mvner
  class RepoScanner

    attr_reader :projects

    def initialize(root)
      @root = root
      @projects = Dir.glob(File.join(root, "**/pom.xml")).map{|loc| Project.new(loc)}
    end
  end
end