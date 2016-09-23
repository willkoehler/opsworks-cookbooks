template "/srv/monitor_drive_space" do
  source "monitor_drive_space.erb"
  owner 'root'
  mode 0744
end

cron "monitor_drive_space" do
  minute "*/5"
  command "/srv/monitor_drive_space"
  path "/usr/local/bin"
  user 'root'
end
