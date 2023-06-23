#! /bin/bash
# Shell script to create WP site

# Site name check
if [ -z "$1" ]; then
  echo "Please provide a site name as an argument."
  exit 1
fi

# Entry in /etc/hosts
host="$1"
echo "127.0.0.1:8000 $host" >> /etc/hosts

#Calling install Requirements
sh ./installrequirements.sh


cd nginx
# Making change to config file for host
cat > default.conf << EOF
events {}
http{
    server {
        listen 80;
        server_name $host;
        root /usr/share/nginx/html;
        index  index.php index.html index.html;

        location / {
            try_files $uri $uri/ /index.php?$is_args$args;
        }

        location ~ \.php$ {
            # try_files $uri =404;
            # fastcgi_pass unix:/run/php-fpm/www.sock;
            fastcgi_split_path_info ^(.+\.php)(/.+)$;
            fastcgi_pass phpfpm:9000;
            fastcgi_index   index.php;
            fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
            include fastcgi_params;
        }
    }
} 
EOF



