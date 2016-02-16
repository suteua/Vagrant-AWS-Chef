require './vagrantconfig'


recipe = ['java']
#
json = JSON.parse(IO.read('./node.json'))

VIRTUAL_MACHINES = {
    "#{ENVIRONMENT}-webapp" => {
        :hostname => "#{ENVIRONMENT}-webapp.altidev.net",`
        :subnetid => "#{SUBNET}",
        :instancetype => "#{VMTYPE}",
        :ami => "#{VMAMI}",
        :securitygroup => 'sg-....',
        :role => ['all'],
        :environment => "#{ENVIRONMENT}",
        :recipe => recipe,
        :tags => {
            :owner => "#{AWS_TAG_OWNER}",
            :group => "#{AWS_TAG_GROUP}",
            :cost_center => "#{AWS_TAG_COST_CENTER}"
        },
        :json => json
    }
}


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "dummy"
  config.vm.box_url = "https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box"
  config.ssh.pty = true
  config.omnibus.chef_version = "11.16.0"
  config.vm.synced_folder ".", "/vagrant", :disabled => true

  VIRTUAL_MACHINES.each do |name, cfg|
    config.vm.define name do |vm_config|
      vm_config.aws_extras.record_name = cfg[:hostname]
      vm_config.aws_extras.record_zone = "#{AWS_EXTRAS_RECORD_ZONE}"
      vm_config.aws_extras.record_type = "#{AWS_EXTRAS_RECORD_TYPE}"
      vm_config.aws_extras.record_ttl = "#{AWS_EXTRAS_RECORD_TTL}"

      vm_config.vm.hostname = cfg[:hostname]
      vm_config.vm.provider :aws do |aws, override|
        aws.access_key_id = "#{ACCESSKEY}"
        aws.secret_access_key = "#{SECRETKEY}"
        aws.keypair_name = "#{KEYPAIRNAME}"
        aws.subnet_id = cfg[:subnetid]
        aws.instance_type = cfg[:instancetype]
        aws.security_groups = cfg[:securitygroup]
        aws.tags = {
            "Name" => cfg[:hostname],
            "owner" => cfg[:tags][:owner],
            "Group" => cfg[:tags][:group],
            "Cost Center" => cfg[:tags][:cost_center]
        }
        aws.ami = cfg[:ami]
        aws.block_device_mapping = [{'DeviceName' => "/dev/sda1", 'Ebs.DeleteOnTermination' => true }]
        aws.user_data = "#!/bin/bash\ncp /etc/sysconfig/network /tmp\nsed -i 's/.*HOSTNAME.*/HOSTNAME=#{cfg[:hostname]}/' /etc/sysconfig/network;hostname #{cfg[:hostname]}"
        #aws.availability_zone = 'us-east-1c'
        override.ssh.username = "#{SSH_USERNAME}"
        override.ssh.private_key_path = "#{SSH_KEY_PATH}"
      end

      vm_config.vm.provision :shell do |sh|
        sh.inline = "sed -i 's/.*HOSTNAME.*/HOSTNAME=#{cfg[:hostname]}/' /etc/sysconfig/network;hostname #{cfg[:hostname]}"
      end

      vm_config.vm.provision "chef_client" do |chef|
        chef.chef_server_url = "#{CHEF_SERVER_URL}"
        chef.node_name = cfg[:hostname]
        chef.validation_client_name = "#{CHEF_VALIDATION_CLIENT_NAME}"
        chef.validation_key_path = "#{CHEF_VALIDATION_KEY_PATH}"
        chef.provisioning_path = "#{CHEF_PROVISIONING_PATH}"
        chef.log_level = CHEF_LOG_LEVEL
        chef.arguments = "#{CHEF_ARGUMENTS}"
        chef.json = cfg[:json]
        if cfg[:role]
          cfg[:role].each do |role|
            chef.add_role role
          end
        end
        if cfg[:recipe]
          cfg[:recipe].each do |recipe|
            chef.add_recipe recipe
          end
        end
        chef.environment = cfg[:environment]
        chef.delete_client = true
        chef.delete_node = true
        #chef.log_level = :debug
      end
    end #define vm_config
  end #Virt
end~                                                                                                        



                                                                                                                                                        
~                                                                                                                                                                                                                                                                
~                                                                                                                                                                                                                                                                
~                                                                                                                                                                                                                                                                
~                                                                                                                                                                                                                                                                
~                                                                                                                                                                                                                                                                
~                                                                                                                                                                                                                                                                
~                                                                                                                                                                                                                                                                
~                                                                                                                                                                                                                                                                
~                                                                                                                                                                                                                                                                
~                                                                                                                                                                                                                                                                
~                                                                                                        
