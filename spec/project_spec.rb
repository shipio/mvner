require 'spec_helper'

describe Mvner::Project do

  let(:project) { Mvner::Project.new 'android-sample/test-main/pom.xml' }

  describe "when scanning the test-main maven android project" do
    it 'should have an artifact id' do
      project.artifact_id.should == 'test-main'
    end

    it 'should have a group id' do
      project.group_id.should == 'com.cisimple.app'
    end

    it 'should have a packaging type' do
      project.packaging.should == 'apk'
    end

    it 'should have a name' do
      project.name.should == 'Test Main Android'
    end

    describe "when the project has dependencies" do

      it 'should have the proper number of dependencies' do
        project.dependencies.count.should == 2
      end

    end

  end
end
