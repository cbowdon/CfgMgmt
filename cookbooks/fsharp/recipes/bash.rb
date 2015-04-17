home = node['fsharp']['home']

package 'tree'

template "#{home}/.bash_profile" do
	source 'bash_profile.erb'
end
