dev_user = node['typescript']['user']
home = node['typescript']['home']

log "dev_user = #{dev_user}"
log "home = #{home}"

package 'emacs'

# git clone --recursive http://github.com/syl20bnr/spacemacs ~/.emacs.d
git "#{home}/.emacs.d" do
  repository 'http://github.com/syl20bnr/spacemacs'
  revision 'master'
  enable_submodules true
  user dev_user
end
