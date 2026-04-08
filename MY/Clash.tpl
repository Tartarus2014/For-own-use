# {{ downloadUrl }}

# 混合端口 # HTTP(S) 和 SOCKS 代理混合端口
mixed-port: 7890

# 允许局域网连接
allow-lan: false
#  find-process-mode has 3 values:always, strict, off
#  - always, 开启，强制匹配所有进程
#  - strict, 默认，由 mihomo 判断是否开启
#  - off, 不匹配进程，推荐在路由器上使用此模式
find-process-mode: strict

# 规则模式：rule（规则） / global（全局代理）/ direct（全局直连）
mode: rule

# 设置日志输出级别：silent / error / warning / info / debug。级别越高日志输出量越大，越倾向于调试，若需要请自行开启。
log-level: info
# 开启 IPv6 总开关，关闭阻断所有 IPv6 链接和屏蔽 DNS 请求 AAAA 记录
ipv6: true
# 是否允许 UDP 通过代理，默认为 false。此选项在 TUIC 等基于 UDP 的协议以及 direct 和 dns 类型中默认开启
udp: true

# 统一延迟。更换延迟计算方式,去除握手等额外延迟
unified-delay: true
# TCP 并发。同时对所有ip进行连接，返回延迟最低的地址
tcp-concurrent: true

# WebUI 配置 WEB UI
external-controller: 127.0.0.1:9090
external-ui: WebUI/ZashBoard
external-ui-url: "https://github.com/Zephyruso/zashboard/releases/latest/download/dist.zip"

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
  override-destination: true 
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

# DNS 配置
dns:
  # 关闭将使用系统 DNS
  enable: true 
  # 是否开启 DoH 支持 HTTP/3，将并发尝试
  prefer-h3: false 
  # 开启 DNS 服务器监听
  listen: 0.0.0.0:1053 
  # 启用IPv6解析
  ipv6: true 
  # 自适应替换缓存算法
  cache-algorithm: arc
  # 模式：redir-host或fake-ip
  enhanced-mode: fake-ip 
  # fake-ip 池设置
  fake-ip-range: 198.18.0.1/16 
  # 配置不使用 fake-ip 的域名
  fake-ip-filter:
    - "*.lan"
    - "*.local"
    - time.*.com
    - ntp.*.com
    - mtalk.google.com
    - alt1-mtalk.google.com
    - alt2-mtalk.google.com
    - alt3-mtalk.google.com
    - alt4-mtalk.google.com
    - alt5-mtalk.google.com
    - alt6-mtalk.google.com
    - alt7-mtalk.google.com
    - alt8-mtalk.google.com
    - alt8-mtalk.google.com
  # 用于解析 DOH/DOT 域名的基础 DNS，必须为静态 IP
  default-nameserver:  
    - 223.5.5.5
    - 119.29.29.29
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
  url: http://g.cn/generate_204
  interval: 300
  proxies: {{ getClashNodeNames(nodeList, customFilters.HK) | json }}
  icon: 'https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/HK.png'

- type: fallback
  name: SG
  url: http://g.cn/generate_204
  interval: 300
  proxies: {{ getClashNodeNames(nodeList, customFilters.SG) | json }}
  icon: 'https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/SG.png'

- type: fallback
  name: JP
  url: http://g.cn/generate_204
  interval: 300
  proxies: {{ getClashNodeNames(nodeList, customFilters.JP) | json }}
  icon: 'https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/JP.png'

- type: fallback
  name: US
  url: http://g.cn/generate_204
  interval: 300
  proxies: {{ getClashNodeNames(nodeList, customFilters.US) | json }}
  icon: 'https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/US.png'
