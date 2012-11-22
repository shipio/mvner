require 'spec_helper'

describe Mvner::RepoScanner do
  describe "when scanning a maven android repository" do
    let(:scanner) { Mvner::RepoScanner.new "android-sample" }

    it "should have 4 poms" do
      scanner.projects.count.should == 4
    end
  end
end