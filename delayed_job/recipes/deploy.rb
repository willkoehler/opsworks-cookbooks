node[:deploy].each do |application, deploy|

  include_recipe "delayed_job::setup"

  execute "restart delayed_job for #{application}" do
    command "sudo monit restart -g delayed_job_#{application}_group"
  end

end
