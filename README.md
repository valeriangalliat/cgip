cgip
====

> CGI IP echo service.

Deployment
----------

Example deployment on a NixOS system (import the following web server
configuration in your `configuration.nix`):

```nix
{ config, pkgs, ... }:

let cgip = pkgs.callPackage /path/to/cgip {};
in {
  services.nginx.enable = true;

  services.nginx.httpConfig = ''
    server {
      listen       80;
      server_name  _;

      location / {
        fastcgi_pass   unix:${config.services.fcgiwrap.socketAddress};
        fastcgi_param  SCRIPT_FILENAME ${cgip}/bin/cgip;
      }
    }
  '';

  services.fcgiwrap.enable = true;

  networking.firewall.allowedTCPPorts = [ 80 ];
}
```
