default[:deploy] = {}
node[:deploy].each do |application, deploy|
  # Keep cached copy of repo between deploys to make pulling code from git faster
  normal[:deploy][application][:delete_cached_copy] = false
end
