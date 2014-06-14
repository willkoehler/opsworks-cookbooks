template "/srv/backup" do
  source "backup.erb"
  owner 'root'
  mode 0744
end

cron "backup_mysql" do
  hour "2"
  minute "0"
  command "/srv/backup >> /var/log/aws/opsworks/backup.log 2>&1"
  path "/usr/local/bin"
  user 'root'
end
