GRANTFILE_API_VERSION = '2'

Vagrant.require_version '>= 1.6.5'

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'aws'
#Amazon access keys
ACCESSKEY=ENV['AWS_ACCESS_KEY']
SECRETKEY=ENV['AWS_SECRET_KEY']
ENVIRONMENT = "<chef-env-name>"
ABSPATH = ENV['RV_ABSPATH']
KEYPAIRNAME = "<key-pair-name>"
SUBNET = "<subnet>"
#Centos 7
VMAMI = "<ami>"
VMTYPE = "<type>"



#DNS stuff
AWS_EXTRAS_RECORD_ZONE = <record-zone>"
AWS_EXTRAS_RECORD_TYPE = "CNAME"
AWS_EXTRAS_RECORD_TTL = "60"

#AWS_TAGS
AWS_TAG_OWNER = "<tag-owner>"
AWS_TAG_GROUP = "<tag-group>"
AWS_TAG_COST_CENTER = "<tag-cost-center>"

#Chef configs
CHEF_SERVER_URL = "<chef-server>"
CHEF_VALIDATION_CLIENT_NAME = "chef-validator"
CHEF_VALIDATION_KEY_PATH = "~/.chef/chef-validation.pem"
CHEF_PROVISIONING_PATH = "/etc/chef"
CHEF_LOG_LEVEL = :info
CHEF_ARGUMENTS = "--logfile /var/log/chef.log"

#SSH configs
SSH_USERNAME = "<ssh-user>"
SSH_KEY_PATH = "<path-to-ssh-user-key>"

