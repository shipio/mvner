require 'spec_helper'

describe Mvner::RepoScanner do
  describe "when scanning a maven android repository" do
    let(:scanner) { Mvner::RepoScanner.new "android-sample" }

    it "should have 4 projects object models" do
      scanner.projects.count.should == 4
    end

    it "should have 1 parent project" do
      scanner.projects.select { |proj| proj.parent? }.count.should == 1
    end

    it "should have 1 apk project" do
      scanner.apks.count.should == 1
    end

    it "should have 2 apklib projects" do
      scanner.apklibs.count.should == 2
    end

    it "should have 0 jar projects" do
      scanner.jars.count.should == 0
    end

  end
end