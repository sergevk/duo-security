# duo-security Cookbook v.0.1.1

Cookbook for install DUO security windows login agent. Can be used for upgrade from older version.

Tested only with version 2.1.0 (Latest to 01.2017)

Known issues:
- Don't work with version 1.2.0.14 (command line parameters is different)
- If wrong version defined - recipe fails.
- Uninstall not supported


## Requirements

The following items should be defined in vault databag:

- Databag: duowinlogin
- Item: [node name]
-- ikey
-- skey
-- host

### Platforms

- Windows

### Chef

- Chef 12.0 or later

### Cookbooks

- `chef-vault` - duo-security needs it for get secrets froom vault.

## Attributes

TODO: List your cookbook attributes here.

e.g.
### duo-security::default

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>default['software']['duowinlogin']['version']</tt></td>
    <td>String</td>
    <td>Version of DUO login agents</td>
    <td><tt>2.1.0</tt></td>
  </tr>
    <td><tt>default['software']['duowinlogin']['msicode']</tt></td>
    <td>String</td>
    <td>MSI code for detect installation</td>
    <td><tt>{AF828DB1-476C-4EDD-BFF1-44456828764F}</tt></td>
  </tr>
</table>

## Usage

### duo-security::duowinlogin

TODO: Write usage instructions for each cookbook.

e.g.
Just include `duo-security` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[duo-security::duowinlogin]"
  ]
}
```

## Contributing

TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

## License and Authors

Authors: Sergey Krandin

