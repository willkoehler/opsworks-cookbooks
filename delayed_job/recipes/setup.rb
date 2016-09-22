# setup delayed_job service per app
node[:deploy].each do |application, deploy|

  # Allow deploy user to restart workers
  template "/etc/sudoers.d/#{deploy[:user]}" do
    mode 0440
    source "sudoer.erb"
    variables :user => deploy[:user]
  end

  template "#{node[:monit][:includes_dir]}/delayed_job_#{application}.monitrc" do
    mode 0644
    source "delayed_job.monitrc.erb"
    variables(:deploy => deploy, :application => application, :delayed_job => node[:delayed_job][application])
  end
end

# reload monit config after changes above
# "sleep 2" is to avoid a "Cannot connect to the monit daemon..." error on next call to "monit restart [...]"
execute "reload monit" do
  command "monit reload && sleep 2"
end
