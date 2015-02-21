dev_user = node['typescript']['user']
home = node['typescript']['home']

package 'vim'

ENV['EDITOR'] = 'vim' # assumes unix - otherwise use chef env resource

template "#{home}/.vimrc" do
	source 'vimrc.erb'
end

directory "#{home}/.vim/" do
    owner dev_user
    mode '0755'
    action :create
end

[ 'backups', 'autoload', 'bundle' ].each do |dir|
    directory "#{home}/.vim/#{dir}" do
        owner dev_user
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
