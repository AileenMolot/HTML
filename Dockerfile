FROM nginx

RUN apt update && apt full-upgrade -y && apt install git -y

#RUN git clone https://github.com/AileenMolot/HTML.git /usr/share/nginx/html/fileshare/
RUN git clone https://github.com/SerhiiD/HTML.git /usr/share/nginx/html/fileshare/

RUN echo "\
server {\n\
    listen       80;\n\
    server_name  localhost;\n\
        location / {\n\
        root   /usr/share/nginx/html/fileshare;\n\
        index  index.html index.htm;\n\
    }\n\
\n\
    error_page   500 502 503 504  /50x.html;\n\
    location = /50x.html {\n\
        root   /usr/share/nginx/html;\n\
    }\n\
}\n\
" > /etc/nginx/conf.d/default.conf