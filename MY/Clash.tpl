# 混合端口 
mixed-port: 7890

# SOCKS5 代理端口
socks-port: 7891

# HTTP 代理端口
port: 7892

# 允许局域网连接
allow-lan: true
# 绑定 IP 地址，仅作用于 allow-lan 为 true，'*'表示所有地址
bind-address: "*"
#  find-process-mode has 3 values:always, strict, off
#  - always, 开启，强制匹配所有进程
#  - strict, 默认，由 mihomo 判断是否开启
#  - off, 不匹配进程，推荐在路由器上使用此模式
find-process-mode: strict
# 全局 TLS 指纹
global-client-fingerprint: chrome

# 规则模式：rule（规则） / global（全局代理）/ direct（全局直连）/ script (脚本)
mode: rule

# 可选的加载模式如下：standard：标准加载器/ memconservative：专为内存受限 (小内存) 设备优化的加载器 (默认值)
geodata-loader: standard
# 更改 geoip 使用文件，mmdb 或者 dat，可选 true/false,true为 dat，此项有默认值 false
geodata-mode: false
# 是否允许 UDP 通过代理，默认为 false。此选项在 TUIC 等基于 UDP 的协议以及 direct 和 dns 类型中默认开启
udp: true

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

# 统一延迟
# 更换延迟计算方式,去除握手等额外延迟
unified-delay: true
# TCP 并发
# 同时对所有ip进行连接，返回延迟最低的地址
tcp-concurrent: true

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
    - any:53
    - tcp://any:53
  auto-detect-interface: true
  auto-route: true
  auto-redirect: true
  mtu: 1500
  udp-timeout: 300
  endpoint-independent-nat: false

# 嗅探域名
sniffer:
  enable: true
  force-dns-mapping: true # 对 redir-host 类型识别的流量进行强制嗅探
  parse-pure-ip: true # 对所有未获取到域名的流量进行强制嗅探
  override-destination: true # 是否使用嗅探结果作为实际访问
  sniff:
    HTTP:
      ports: [80, 8080-8880]
      override-destination: true
    TLS:
      ports: [443, 8443]
    QUIC:
      ports: [443, 8443]
  force-domain:
    - '+.v2ex.com'
  skip-domain: # 需要跳过嗅探的域名, 主要解决部分站点 sni 字段非域名, 导致嗅探结果异常的问题, 如米家设备
    - "Mijia Cloud"
    - "dlg.io.mi.com"
    - "+.push.apple.com"
    - "+.apple.com"

# DNS 配置
dns:
  cache-algorithm: arc
  enable: true # 关闭将使用系统 DNS
  prefer-h3: true # 是否开启 DoH 支持 HTTP/3，将并发尝试
  listen: 0.0.0.0:1053 # 开启 DNS 服务器监听
  ipv6: true # 启用IPv6解析
  ipv6-timeout: 300 # 单位：ms，内部双栈并发时，向上游查询 AAAA 时，等待 AAAA 的时间，默认 100ms
  enhanced-mode: fake-ip # 模式：redir-host或fake-ip
  fake-ip-range: 198.18.0.1/16 # fake-ip 池设置
  use-hosts: true # 查询 hosts
  # 配置不使用 fake-ip 的域名
  fake-ip-filter:
    # === LAN ===
    - '*.lan'
    - '*.localdomain'
    - '*.example'
    - '*.invalid'
    - '*.localhost'
    - '*.test'
    - '*.local'
    - '*.home.arpa'
    # === FCM ===
    - 'mtalk.google.com'
    - 'mtalk4.google.com'
    - 'mtalk-staging.google.com'
    - 'mtalk-dev.google.com'
    - 'alt1-mtalk.google.com'
    - 'alt2-mtalk.google.com'
    - 'alt3-mtalk.google.com'
    - 'alt4-mtalk.google.com'
    - 'alt5-mtalk.google.com'
    - 'alt6-mtalk.google.com'
    - 'alt7-mtalk.google.com'
    - 'alt8-mtalk.google.com'
    # === Apple Software Update Service ===
    - 'mesu.apple.com'
    - 'swscan.apple.com'
    - 'swquery.apple.com'
    - 'swdownload.apple.com'
    - 'swcdn.apple.com'
    - 'swdist.apple.com'
    # === Windows 10 Connnect Detection ===
    - '*.msftconnecttest.com'
    - '*.msftncsi.com'
    # === NTP Service ===
    - 'time.*.com'
    - 'time.*.gov'
    - 'time.*.edu.cn'
    - 'time.*.apple.com'
    - 'time1.*.com'
    - 'time2.*.com'
    - 'time3.*.com'
    - 'time4.*.com'
    - 'time5.*.com'
    - 'time6.*.com'
    - 'time7.*.com'
    - 'ntp.*.com'
    - 'ntp1.*.com'
    - 'ntp2.*.com'
    - 'ntp3.*.com'
    - 'ntp4.*.com'
    - 'ntp5.*.com'
    - 'ntp6.*.com'
    - 'ntp7.*.com'
    - '*.time.edu.cn'
    - '*.ntp.org.cn'
    - '+.pool.ntp.org'
    - 'time1.cloud.tencent.com'
    # === Music Service ===
    # 网易云音乐
    - 'music.163.com'
    - '*.music.163.com'
    - '*.126.net'
    # QQ音乐
    - '+.y.qq.com'
    - '+.music.tc.qq.com'
    - 'aqqmusic.tc.qq.com'
    - '+.stream.qqmusic.qq.com'
    # === Game ===
    # Steam
    - '+.steamcontent.com'
    # Nintendo Switch
    - '+.srv.nintendo.net'
    - '*.n.n.srv.nintendo.net'
    - '+.cdn.nintendo.net'
    # Sony PlayStation
    - '+.stun.playstation.net'
    # Microsoft Xbox
    - 'xbox.*.microsoft.com'
    - '+.xboxlive.com'
    - '+.xboxlive.cn'
    # Wotgame
    - '+.battlenet.com.cn'
    - '+.wotgame.cn'
    - '+.wggames.cn'
    - '+.wowsgame.cn'
    - '+.wargaming.net'
    # === Streaming Media ===
    # Netflix
    - '+.nflxvideo.net'
    # Bilibili
    - '*.mcdn.bilivideo.cn'
    # Disney Plus
    - '+.media.dssott.com'
    # === Other ===
    # QQ Quick Login
    - 'localhost.ptlogin2.qq.com'
    - 'localhost.sec.qq.com'
    - '+.qq.com'
    - '+.tencent.com'
    # STUN
    - 'stun.*.*'
    - 'stun.*.*.*'
    # Xiaomi
    - '+.market.xiaomi.com'
    # 迅雷
    - '+.sandai.net'
    - '+.n0808.com'
  default-nameserver:  # 基础DNS服务器，用于解析其他DNS服务器的地址
    - tls://223.5.5.5
    - tls://223.6.6.6
  proxy-server-nameserver:  # 专用于节点域名解析的 DNS 服务器
    - tls://223.5.5.5
    - tls://223.6.6.6
  nameserver:  # 主要DNS服务器列表
    - https://dns.alidns.com/dns-query  # 阿里 DoH
    - https://doh.pub/dns-query  # DNSPod DoH

    
proxies: {{ getClashNodes(nodeList) | json }}

proxy-groups:
- name: FINAL
  type: select
  proxies:
  - DIRECT
  - PROXY

- name: PROXY
  type: select
  proxies:
  - HK
  - SG
  - JP

- name: Emby
  type: select
  proxies:
  - HK
  - SG
  - US

- name: FCM
  type: select
  proxies:
  - DIRECT
  - US
  - SG

- type: fallback
  name: HK
  url: http://www.gstatic.com/generate_204
  interval: 300
  proxies: {{ getClashNodeNames(nodeList, customFilters.HK) | json }}

- type: fallback
  name: JP
  url: http://www.gstatic.com/generate_204
  interval: 300
  proxies: {{ getClashNodeNames(nodeList, customFilters.JP) | json }}

- type: fallback
  name: SG
  url: http://www.gstatic.com/generate_204
  interval: 300
  proxies: {{ getClashNodeNames(nodeList, customFilters.SG) | json }}

- type: fallback
  name: US
  url: http://www.gstatic.com/generate_204
  interval: 300
  proxies: {{ getClashNodeNames(nodeList, customFilters.US) | json }}