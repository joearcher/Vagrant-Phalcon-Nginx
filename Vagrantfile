Vagrant::Config.run do |config|

  # The base box we are building off
  config.vm.box = "ubuntu/trusty32"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "https://atlas.hashicorp.com/ubuntu/boxes/trusty32"

  # Boot with a GUI so you can see the screen. Good for debugging startup issues. (Default is headless)
  # config.vm.boot_mode = :gui

  # Assign this VM to a host-only network IP, allowing you to access it
  # via the IP. Host-only networks can talk to the host machine as well as
  # any other machines on the same network, but cannot be accessed (through this
  # network interface) by any external networks.
  # config.vm.network :hostonly, "33.33.33.10"

  # Forward a port from the guest to the host, which allows for outside
  # computers to access the VM, whereas host only networking does not.
  config.vm.forward_port 80, 8080

  # Share an additional folder to the guest VM. The first argument is
  # an identifier, the second is the path on the guest to mount the
  # folder, and the third is the path on the host to the actual folder.
  # For this example, this folder should contain an index.php file.
  config.vm.share_folder "webroot", "/opt/my_project", "./"

  # Enable provisioning with Puppet stand alone.

  config.vm.provision :puppet, :module_path => "puppet/modules" do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file  = "base.pp"
  end

  config.vm.provision "shell", path: "install-phalcon.sh"


end
