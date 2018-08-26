# WCK This file has been customized for compatibility with MySQL 5.7

# for backwards compatiblity default the package name to mysql
# mysql_name = node[:mysql][:name] || "mysql"
mysql_service_name = node[:mysql][:service_name] || "mysqld"

service "mysql" do
  case node[:platform]
  when "redhat", "centos", "fedora", "amazon"
    # service_name "#{mysql_name}d"   # WCK service name should not be locked to package name (i.e. mysql57)
    service_name mysql_service_name
  else
    service_name "mysql"
  end

  if platform?('ubuntu') && node[:platform_version].to_f >= 10.04
      provider Chef::Provider::Service::Upstart
  end
  supports :status => true, :restart => true, :reload => true
  action :nothing
end