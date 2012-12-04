require 'spec_helper'

describe Mvner::Dependency do

  let(:project) { Mvner::Project.new File.join(File.dirname(__FILE__), 'android-sample/test-main/pom.xml'),
                                     File.join(File.dirname(__FILE__), 'android-sample/')}

  describe "when scanning the test-main maven android project" do
    describe "when evaluating the project's android dependency" do
      let(:dependency) { project.dependencies[0] }

      it 'should have a dependency with an artifact id of android' do
        dependency.artifact_id.should == 'android'
      end

      it 'should have a dependency with an group id of android' do
        dependency.group_id.should == 'android'
      end

      it 'should have a dependency with a version of 4.1.2_r3' do
        dependency.version.should == '4.1.2_r3'
      end
    end

    describe "when evaluating the project's android lib dependency" do
      let(:dependency) { project.dependencies[1] }

      it 'should have a dependency with type of apklib' do
        dependency.type.should == 'apklib'
      end
    end
  end
end