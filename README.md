# rancher-xe-guest-utils
RancherOS Xen Guest Utilities

**It looks as though stats reporting works, but reboot/shutdown doesn't, I'm currently investigating this**

## Instructions
The service can be added directly to your `cloud-config.yml`
```yml
#cloud-config.yml
rancher:
  services_include:
     https://raw.githubusercontent.com/Klowner/rancher-xe-guest-utils/master/xe-guest-utils.yml: true
```
Or it can be enabled later with
```bash
$ sudo ros service enable https://raw.githubusercontent.com/Klowner/rancher-xe-guest-utils/master/xe-guest-utils.yml
```
