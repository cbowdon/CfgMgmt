#
# Cookbook Name:: linux_typescript
# Recipe:: default
#
package 'git'
package 'tree'
package 'vim'
package 'npm'

home = '/home/vagrant'

template "#{home}/.bash_profile" do
	source 'bash_profile.erb'
end

template "#{home}/.vimrc" do
	source 'vimrc.erb'
end

directory "#{home}/.vim/" do
    owner 'vagrant'
    mode '0755'
    action :create
end

[ 'backups', 'autoload', 'bundle' ].each do |dir|
    directory "#{home}/.vim/#{dir}" do
        owner 'vagrant'
        mode '0755'
        action :create
    end
end

remote_file "#{home}/.vim/autoload/pathogen.vim" do
    source 'https://tpo.pe/pathogen.vim'
end

git "#{home}/.vim/bundle/syntastic" do
    repository 'git://github.com/scrooloose/syntastic.git'
end

git "#{home}/.vim/bundle/typescript-vim" do
    repository 'git://github.com/leafgarland/typescript-vim.git'
end

git "#{home}/.vim/bundle/vim-js-indent" do
    repository 'git://github.com/jason0x43/vim-js-indent.git'
end
