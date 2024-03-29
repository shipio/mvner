require 'spec_helper'

describe Mvner::Project do
  describe "when scanning the test-main maven android project" do
    let(:project) { Mvner::Project.new File.join(File.dirname(__FILE__), 'android-sample/test-main/pom.xml'),
                                       File.join(File.dirname(__FILE__), 'android-sample/')}

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
    let(:project) { Mvner::Project.new File.join(File.dirname(__FILE__), 'android-sample/pom.xml'),
                                       File.join(File.dirname(__FILE__), 'android-sample/') }

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

  describe "when serilizing the test-main maven android project" do
    let(:project) { Mvner::Project.new File.join(File.dirname(__FILE__), 'android-sample/pom.xml'),
                                       File.join(File.dirname(__FILE__), 'android-sample/') }
    let(:proj_json) { JSON.parse(project.to_json) }

    it 'should have an artifact_id' do
      proj_json["artifact_id"].should == project.artifact_id
    end

    it 'should have a version' do
      proj_json["version"].should == project.version
    end

    it 'should have a group_id' do
      proj_json["group_id"].should == project.group_id
    end
  end

end
