dev_user = node['typescript']['user']
home = node['typescript']['home']

log "dev_user = #{dev_user}"
log "home = #{home}"

package 'git'
package 'nodejs-legacy' # fix for different node binary name in Ubuntu
package 'npm'

require 'mkmf'

def npm_global_install prog
    Chef::Log.info "npm install -g #{prog}"
    bash "install #{prog}" do
        not_if { find_executable prog }
        code "npm install -g #{prog}"
    end
end

npm_global_install 'typescript'
npm_global_install 'tsd'
npm_global_install 'browserify'
npm_global_install 'jake'

ts_tools = 'typescript-tools'

git "#{home}/#{ts_tools}" do
    repository 'git://github.com/clausreinke/typescript-tools.git'
end

log "yaoooo"
log ::File.dirname("#{home}/#{ts_tools}")

bash "install #{ts_tools}" do
    cwd '/home/vagrant/typescript-tools'
    code "npm install -g"
end
