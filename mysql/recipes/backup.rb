template "/srv/backup" do
  source "backup.erb"
  owner 'root'
  mode 0744
end

cron "backup_mysql" do
  hour "6"
  minute "0"
  command "/srv/backup"
  path "/usr/local/bin"
  user 'root'
end
