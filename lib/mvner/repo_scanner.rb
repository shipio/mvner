module Mvner
  class RepoScanner

    attr_reader :projects

    def initialize(root = Dir.pwd)
      @root = root
      @projects = Dir.glob(File.join(root, "**/pom.xml")).map { |loc|
        Project.new(loc, root)
      }
    end

    def apks
      @projects.select { |proj| proj.packaging == "apk" }
    end

    def apklibs
      @projects.select { |proj| proj.packaging == "apklib" }
    end

    def jars
      @projects.select { |proj| proj.packaging == "jar" }
    end
  end
end