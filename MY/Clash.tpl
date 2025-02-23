# {{ downloadUrl }}

# 混合端口 
mixed-port: 7890

# HTTP 代理端口
port: 7892

# SOCKS5 代理端口
socks-port: 7891

# 允许局域网的连接（可用来共享代理）
allow-lan: true

ipv6: true

# 规则模式：rule（规则） / global（全局代理）/ direct（全局直连）/ script (脚本)
mode: rule

# 设置日志输出级别 （默认级别：silent，即不输出任何内容，以避免因日志内容过大而导致程序内存溢出）。
# 5 个级别：silent / error / warning / info / debug。级别越高日志输出量越大，越倾向于调试，若需要请自行开启。
log-level: silent

# Clash 的 RESTful API
external-controller: 127.0.0.1:9090
dns:
  enable: true  # 启用DNS服务
  ipv6: true  # 启用IPv6解析
  listen: 0.0.0.0:53  # DNS服务监听地址和端口
  enhanced-mode: fake-ip # 模式：redir-host或fake-ip
  fake-ip-range: 198.18.0.1/16 #  # fake-ip地址池范围
  fake-ip-filter: 
    - "*.lan"  # 用于局域网。
    - "*.localdomain"  # 用于本地网络。
    - "*.localhost"  # 指向本地回环地址。
    - "*.local"  # mDNS 常用的域名。
    - "*.home.arpa"  # 用于家庭网络。
    - mtalk.google.com  # FCM域名。
    - alt1-mtalk.google.com  # FCM域名。
    - alt2-mtalk.google.com  # FCM域名。
    - alt3-mtalk.google.com  # FCM域名。
    - alt4-mtalk.google.com  # FCM域名。
    - alt5-mtalk.google.com  # FCM域名。
    - alt6-mtalk.google.com  # FCM域名。
    - alt7-mtalk.google.com  # FCM域名。
    - alt8-mtalk.google.com  # FCM域名。
  default-nameserver:  # 基础DNS服务器，用于解析其他DNS服务器的地址
    - 180.184.1.1  # 字节 DNS
    - 223.5.5.5  # 阿里 DNS
    - 119.29.29.29  # 腾讯 DNS
  nameserver:  # 主要DNS服务器列表
    - https://dns.alidns.com/dns-query  # 阿里 DoH
    - https://doh.pub/dns-query  # DNSPod DoH
  fallback:  # 国外域名DNS服务器
    - https://1.1.1.1/dns-query  # CloudFlare DoH
    - https://8.8.8.8/dns-query  # Google DoH
  fallback-filter:  # fallback触发条件
    geoip: true  # 启用 GeoIP
    geoip-code: CN  # 国家代码
    ipcidr: # 在这个网段内的 IP 地址会被考虑为被污染的 IP
      - 240.0.0.0/4  # 保留地址，检测 DNS 污染
    domain:
      - "+.google.com"  # Google相关域名    
      - "+.facebook.com"  # Facebook相关域名
      - "+.youtube.com"  # YouTube相关域名
      - "+.twitter.com"  # twitter相关域名
      - "+.instagram.com"  # instagram相关域名
      - "+.telegram.org" # Telegram相关域名
      - "+.whatsapp.com" # Whatsapp相关域名
