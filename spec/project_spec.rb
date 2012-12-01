require 'spec_helper'

describe Mvner::Project do
  describe "when scanning the test-main maven android project" do
    let(:project) { Mvner::Project.new 'android-sample/test-main/pom.xml' }

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

  describe "when scanning the test-main maven android project" do
    let(:project) { Mvner::Project.new 'android-sample/pom.xml' }

    it 'should have 1 module located at test-main' do
      project.modules["test-main"].should_not be_nil
    end

    it 'should have a test-main module with an artifact_id of test-main' do
      project.modules["test-main"].artifact_id.should == 'test-main'
    end

    it 'should have a test-main module with an artifact_id of test-main' do
      project.modules["test-main"].dependencies.count.should == 2
    end

    it 'should have 1 module located at dependency1' do
      project.modules["dependency1"].should_not be_nil
    end

    it 'should have 1 module located at dependency2' do
      project.modules["dependency2"].should_not be_nil
    end

    it 'should have 1 module located at dependency2 and allow indifferent access to the hash' do
      project.modules[:dependency2].should_not be_nil
    end

  end

end
