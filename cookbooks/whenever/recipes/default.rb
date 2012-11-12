#
# Cookbook Name:: whenever
# Recipe:: default
#

ey_cloud_report "whenever" do
  message "starting whenever recipe"
end

# Set your application name here
appname = "archivalock"

allowed_roles = %w(solo util)

if allowed_roles.include?( node[:instance_role] )
  ey_cloud_report "whenever" do
    message "executing whenever because instance_role is in #{allowed_roles.inspect}"
  end

  local_user = node[:users].first

  execute "whenever" do
    cwd "/data/#{appname}/current"
    user local_user[:username]
    command "bundle exec whenever --update-crontab '#{appname}_#{node[:environment][:framework_env]}'"
    action :run
  end
else
  ey_cloud_report "whenever" do
    message "NOT executing whenever because instance_role is not in #{allowed_roles.inspect}"
  end
end

ey_cloud_report "whenever" do
  message "whenever recipe complete"
end
