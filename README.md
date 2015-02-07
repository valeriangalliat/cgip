cgip
====

> CGI IP echo service.

Installation
------------

```
git clone https://github.com/valeriangalliat/cgip.git
cd cgip
make
```

Then, add the following in your nginx `http` block (tweak the FastCGI
server location if needed):

```nginx
server {
    listen       80;
    server_name  ip.example.com;

    location / {
        fastcgi_pass   unix:/var/run/fcgiwrap/fcgiwrap.sock;
        fastcgi_param  SCRIPT_FILENAME /path/to/cgip/cgip;
        include        fastcgi_params;
    }
}
```
