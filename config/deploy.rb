# The name of your app
set :application, "century21ap"
# The directory on the EC2 node that will be deployed to
set :deploy_to, "rails/#{application}"
# The type of Source Code Management system you are using
set :scm, :git
# The location of the LOCAL repository relative to the current app
set :repository,  ".git"
# The way in which files will be transferred from repository to remote host
# If you were using a hosted github repository this would be slightly different
set :deploy_via, :copy

# The address of the remote host on EC2 (the Public DNS address)
set :location, "ubuntu@ec2-50-17-70-234.compute-1.amazonaws.com"
# setup some Capistrano roles
role :app, location
role :web, location
role :db,  location, :primary => true

# Set up SSH so it can connect to the EC2 node - assumes your SSH key is in ~/.ssh/id_rsa
set :user, "ubuntu"
ssh_options[:keys] = [File.join(ENV["HOME"], ".ssh", "id_rsa")]	
