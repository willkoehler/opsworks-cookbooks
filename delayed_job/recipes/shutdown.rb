node[:deploy].each do |application, deploy|

  execute "stop delayed_job for #{application}" do
    command "monit stop -g delayed_job_#{application}_group"
  end
end
