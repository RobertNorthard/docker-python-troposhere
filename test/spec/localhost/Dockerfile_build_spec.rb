require 'serverspec'
require 'docker'

describe "Dockerfile#build" do


  before(:all) do
    @docker_image = Docker::Image.build_from_dir('.')
    set :backend, :docker
    set :os, family: :debian
    set :docker_image, @docker_image.id   
  end

  describe command('python --version') do
    its(:exit_status) { should eq 0 }
    its(:stdout) { should eq "Python 3.4.2\n" }    
  end

end