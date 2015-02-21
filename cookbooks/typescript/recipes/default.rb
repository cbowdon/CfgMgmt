package 'git'
package 'npm'

require 'mkmf'

def npm_global_install prog
    bash "install #{prog}" do
        not_if { find_executable prog }
        code "npm install -g #{prog}"
    end
end

npm_global_install 'typescript'
npm_global_install 'tsd'
npm_global_install 'typescript-tools'
