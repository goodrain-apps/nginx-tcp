## 支持stream

默认配置路径`/usr/local/nginx/conf/sites_stream`

## 支持http

默认配置路径`/usr/local/nginx/conf/sites_http`


## 部署在Rainbond

需要关联需要反向代理的应用。stream协议

```
# 10443 需要反向代理的应用监听端口
upstream kube {
        least_conn;
        server 127.0.0.1:10443 max_fails=2 fail_timeout=30s;
}
server {
        listen        127.0.0.1:6443;
        proxy_pass    kube;
        proxy_timeout 10m;
        proxy_connect_timeout 1s;
}
```