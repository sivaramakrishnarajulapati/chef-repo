
#
# The package, named "httpd" is installed
#
# @see https://docs.chef.io/resource_package.html
#
package 'httpd'

template '/var/www/html/index.html' do
  source 'index.html.erb'
end

template '/etc/httpd/conf/httpd.conf' do
  action :create
  source 'httpd.conf.erb'
  notifies :restart, 'service[httpd]'
end

service 'httpd' do
  action [:enable, :start]
end
