default['software']['duowinlogin']['msicode'] = '{AF828DB1-476C-4EDD-BFF1-44456828764F}'
default['software']['duowinlogin']['version'] = '2.1.0'
default['software']['duowinlogin']['installer'] = ::File.join(Chef::Config[:file_cache_path], 'duo-win-login.exe')
default['software']['duowinlogin']['downloadurl'] = "https://dl.duosecurity.com/duo-win-login-#{node['software'][software]['version']}.exe"
