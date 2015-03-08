# Configuration Management resources

This is a(n embryonic) project to abstract away repeated config management tasks, like setting up dev machines. So somewhere to store any Chef cookbooks and Vagrantfiles that might be reusable.

## Usage
Usage at this stage is manually copying/linking to the appropriate files. Putting together a helper CLI app is on my todo-list.

Currently included setups:
* vagrant: Ubuntu 12.04 on VirtualBox set up for TypeScript development in Vim

## TODO
A helper CLI program would be nice, something like:

    devenv configure <cookbook name>    # to drop configs into the current directory
    devenv provision                    # vagrant up, provision, etc.
    devenv clean <optional directory>   # to rm configs, vagrant destroy, etc.

It would be backed by a ~/.devenv that would contain args like path to this repo.
