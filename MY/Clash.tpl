# 混合端口 # HTTP(S) 和 SOCKS 代理混合端口
mixed-port: 7890

# 允许局域网连接
allow-lan: true
# 绑定 IP 地址，仅作用于 allow-lan 为 true，'*'表示所有地址
bind-address: "*"
#  find-process-mode has 3 values:always, strict, off
#  - always, 开启，强制匹配所有进程
#  - strict, 默认，由 mihomo 判断是否开启
#  - off, 不匹配进程，推荐在路由器上使用此模式
find-process-mode: strict

# 规则模式：rule（规则） / global（全局代理）/ direct（全局直连）
mode: rule
# 更改 geoip 使用文件
geodata-mode: true
# 可选的加载模式如下：standard：标准加载器/ memconservative：专为内存受限 (小内存) 设备优化的加载器
geodata-loader: standard
#自定义 geodata url
geox-url:
  geoip: "https://github.com/MetaCubeX/meta-rules-dat/releases/download/latest/geoip.dat"
  geosite: "https://github.com/MetaCubeX/meta-rules-dat/releases/download/latest/geosite.dat"
  mmdb: "https://github.com/MetaCubeX/meta-rules-dat/releases/download/latest/geoip.metadb"
  asn: "https://github.com/MetaCubeX/meta-rules-dat/releases/download/latest/GeoLite2-ASN.mmdb"
# 是否自动更新 geodata
geo-auto-update: true
# 更新间隔，单位：小时
geo-update-interval: 24

# 设置日志输出级别：silent / error / warning / info / debug。级别越高日志输出量越大，越倾向于调试，若需要请自行开启。
log-level: info
# 开启 IPv6 总开关，关闭阻断所有 IPv6 链接和屏蔽 DNS 请求 AAAA 记录
ipv6: true

# 统一延迟。更换延迟计算方式,去除握手等额外延迟
unified-delay: true
# TCP 并发。同时对所有ip进行连接，返回延迟最低的地址
tcp-concurrent: true

# WebUI 配置 WEB UI
external-controller: 127.0.0.1:9090
external-ui: WebUI/ZashBoard
external-ui-url: "https://github.com/Zephyruso/zashboard/releases/latest/download/dist.zip"

hosts:
  'dns.alidns.com': ['223.5.5.5', '223.6.6.6']
  'doh.pub': ['1.12.12.21', '120.53.53.53']
  'dns.google': ['8.8.8.8', '8.8.4.4']
  'cloudflare-dns.com': ['1.1.1.1', '1.0.0.1']

# 缓存
profile:
  # 储存 API 对策略组的选择，以供下次启动时使用
  store-selected: true
  # 储存 fakeip 映射表，域名再次发生连接时，使用原有映射地址
  store-fake-ip: true

# Tun 配置
tun:
  enable: true
  # stack
  # tun 模式堆栈，如无使用问题，建议使用 mixed栈，默认 gvisor
  # 可用值： system/gvisor/mixed
  # system 使用系统协议栈，可以提供更稳定/全面的 tun 体验，且占用相对其他堆栈更低
  # gvisor 通过在用户空间中实现网络协议栈，可以提供更高的安全性和隔离性，同时可以避免操作系统内核和用户空间之间的切换，从而在特定情况下具有更好的网络处理性能
  # mixed 混合堆栈，tcp 使用 system栈，udp 使用 gvisor栈，使用体验可能相对更好
  stack: mixed
  dns-hijack:
    - "any:53"
    - "tcp://any:53"
  auto-detect-interface: true
  auto-route: true
  auto-redirect: true

# 嗅探域名
sniffer:
  enable: true
  # 对 redir-host 类型识别的流量进行强制嗅探
  force-dns-mapping: true
  # 对所有未获取到域名的流量进行强制嗅探
  parse-pure-ip: true 
  # 是否使用嗅探结果作为实际访问
  override-destination: false 
  sniff:
    HTTP:
      ports: [80, 8080-8880]
      override-destination: true
    TLS:
      ports: [443, 8443]
    QUIC:
      ports: [443, 8443]
  # 需要跳过嗅探的域名, 主要解决部分站点 sni 字段非域名, 导致嗅探结果异常的问题, 如米家设备
  skip-domain: 
    - "Mijia Cloud"
    - "+.push.apple.com"
  # 对于目标ip跳过嗅探
  skip-dst-address:
  # Telegram IPv4 地址段
    - "91.108.4.0/22"
    - "91.108.8.0/22"
    - "91.108.12.0/22"
    - "91.108.16.0/22"
    - "91.108.20.0/22"
    - "91.108.56.0/22"
    - "149.154.160.0/20"
    - "185.76.151.0/24"
    - "95.161.64.0/20"

# DNS 配置
dns:
  # 自适应替换缓存算法
  cache-algorithm: arc
  # 关闭将使用系统 DNS
  enable: true 
  # 是否开启 DoH 支持 HTTP/3，将并发尝试
  prefer-h3: false 
  # 开启 DNS 服务器监听
  listen: 0.0.0.0:1053 
  # 启用IPv6解析
  ipv6: true 
  # 单位：ms，内部双栈并发时，向上游查询 AAAA 时，等待 AAAA 的时间
  ipv6-timeout: 300
  # 是否回应配置中的 hosts
  use-hosts: true
  # 是否查询系统 hosts
  use-system-hosts: true
  # 模式：redir-host或fake-ip
  enhanced-mode: fake-ip 
  # fake-ip 池设置
  fake-ip-range: 198.18.0.1/16
  # 设置 fake-ip 过滤模式
  fake-ip-filter-mode: blacklist
  # 配置不使用 fake-ip 的域名
  fake-ip-filter:
    - +.lan
    - +.local
    - time.*.com
    - time.*.gov
    - time.*.edu.cn
    - time.apple.com
    - ntp.*.com
    - '*.time.edu.cn'
    - '*.ntp.org.cn'
    - +.pool.ntp.org
    - mtalk.google.com
    - alt1-mtalk.google.com
    - alt2-mtalk.google.com
    - alt3-mtalk.google.com
    - alt4-mtalk.google.com
    - alt5-mtalk.google.com
    - alt6-mtalk.google.com
    - alt7-mtalk.google.com
    - alt8-mtalk.google.com
  # 用于解析 DOH/DOT 域名的基础 DNS，必须为静态 IP
  default-nameserver:  
    - 223.5.5.5
    - 223.6.6.6
    - 119.29.29.29
    - 182.254.116.116
  # 强制部分请求走直连 DNS 解析（用于 DIRECT 规则）
  direct-nameserver:
    - https://dns.alidns.com/dns-query
    - https://doh.pub/dns-query
  # 代理服务器域名解析（用于连接节点服务器）
  proxy-server-nameserver:
    - https://dns.alidns.com/dns-query
    - https://doh.pub/dns-query
  # 主要解析服务器 （作为兜底）
  nameserver: 
    - https://dns.alidns.com/dns-query
    - https://doh.pub/dns-query
  # 根据域名分流 DNS
  nameserver-policy:
    "geosite:cn":
    - https://dns.alidns.com/dns-query
    - https://doh.pub/dns-query
    "geosite:!cn":
    - https://dns.google/dns-query#PROXY
    - https://cloudflare-dns.com/dns-query#PROXY


proxies: {{ getClashNodes(nodeList) | json }}

proxy-groups:
- name: FINAL
  type: select
  proxies:
  - DIRECT
  - PROXY
  icon: 'https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Final.png'

- name: PROXY
  type: select
  proxies:
  - HK
  - SG
  - JP
  icon: 'https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Proxy.png'

- name: Telegram
  type: select
  proxies:
  - HK
  - SG
  icon: 'https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Telegram.png'

- name: Emby
  type: select
  proxies:
  - DIRECT
  - US
  - JP
  - SG
  icon: 'https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Emby.png'

- type: fallback
  name: HK
  url: http://www.gstatic.com/generate_204
  interval: 300
  proxies: {{ getClashNodeNames(nodeList, customFilters.HK) | json }}
  icon: 'https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/HK.png'

- type: fallback
  name: SG
  url: http://www.gstatic.com/generate_204
  interval: 300
  proxies: {{ getClashNodeNames(nodeList, customFilters.SG) | json }}
  icon: 'https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/SG.png'

- type: fallback
  name: JP
  url: http://www.gstatic.com/generate_204
  interval: 300
  proxies: {{ getClashNodeNames(nodeList, customFilters.JP) | json }}
  icon: 'https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/JP.png'

- type: fallback
  name: US
  url: http://www.gstatic.com/generate_204
  interval: 300
  proxies: {{ getClashNodeNames(nodeList, customFilters.US) | json }}
  icon: 'https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/US.png'
