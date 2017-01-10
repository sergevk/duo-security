# This is a Chef recipe file. It can be used to specify resources which will
# apply configuration to a server.

### ToDo
### (+) Move parameters to Vault
### (+) Check parameters before install
### Add checksum
### (+) Prevent fault if soft not installed
### Report about failure

include_recipe 'chef-vault'

software = 'duowinlogin'

### Check if vault exist
begin
    vault = ChefVault::Item.load(software, node.name)
    node.default['software'][software]['options'] = '/S /V" /qn IKEY="'+vault['ikey']+'" SKEY="'+vault['skey']+'" HOST="'+vault['host']+'" AUTOPUSH="#1" FAILOPEN="#1" SMARTCARD="#1" RDPONLY="#0"" '

    # Check that software installed (MSI code)
    if !( powershell_out("get-wmiobject -class Win32_Product | where {$_.IdentifyingNumber -eq  '"+node['software']["#{software}"]["msicode"]+"' }").stdout.empty? )
        log "Software: #{software}  already installed: #{node['software'][software]['msicode']}"
    else
        download = remote_file node['software'][software]['installer'] do
            action :create
            source node['software'][software]['downloadurl']
        #    checksum checksum if checksum
        end

        install = package software do
            action :install
            source node["software"][software]["installer"] 
            installer_type :other
            options node['software'][software]['options']
            provider Chef::Provider::Package::Windows
        end
    end

rescue ChefVault::Exceptions::KeysNotFound => e
  log e.message
  log "Secrets for #{software} not found. Installation aborted."
  log "For install #{software} need to define Chef vault: Databag: [#{software}]; item: [#{node.name}]; keys: [ikey, skey, host]"
end
