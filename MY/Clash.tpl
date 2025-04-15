mixed-port: 7890 # 混合端口 

socks-port: 7891 # SOCKS5 代理端口

port: 7892 # HTTP 代理端口

allow-lan: true # 允许局域网连接
bind-address: "*" # 绑定 IP 地址，仅作用于 allow-lan 为 true，'*'表示所有地址
skip-auth-prefixes: # 设置跳过验证的 IP 段
  - 127.0.0.1/8
  - ::1/128
lan-allowed-ips: # 允许连接的 IP 地址段，仅作用于 allow-lan 为 true, 默认值为 0.0.0.0/0 和::/0
  - 0.0.0.0/0
  - ::/0
#  find-process-mode has 3 values:always, strict, off
#  - always, 开启，强制匹配所有进程
#  - strict, 默认，由 mihomo 判断是否开启
#  - off, 不匹配进程，推荐在路由器上使用此模式
find-process-mode: strict

mode: rule # 规则模式：rule（规则） / global（全局代理）/ direct（全局直连）/ script (脚本)

geodata-loader: standard # 可选的加载模式如下：standard：标准加载器/ memconservative：专为内存受限 (小内存) 设备优化的加载器 (默认值)
geodata-mode: false # 更改 geoip 使用文件，mmdb 或者 dat，可选 true/false,true为 dat，此项有默认值 false
udp: true # 是否允许 UDP 通过代理，默认为 false。此选项在 TUIC 等基于 UDP 的协议以及 direct 和 dns 类型中默认开启

geox-url: #自定义 geodata url
  geoip: "https://github.com/MetaCubeX/meta-rules-dat/releases/download/latest/geoip.dat"
  geosite: "https://github.com/MetaCubeX/meta-rules-dat/releases/download/latest/geosite.dat"
  mmdb: "https://github.com/MetaCubeX/meta-rules-dat/releases/download/latest/geoip.metadb"
  asn: "https://github.com/MetaCubeX/meta-rules-dat/releases/download/latest/GeoLite2-ASN.mmdb"
geo-auto-update: true # 是否自动更新 geodata
geo-update-interval: 24 # 更新间隔，单位：小时

log-level: info # 设置日志输出级别：silent / error / warning / info / debug。级别越高日志输出量越大，越倾向于调试，若需要请自行开启。

ipv6: true # 开启 IPv6 总开关，关闭阻断所有 IPv6 链接和屏蔽 DNS 请求 AAAA 记录

tcp-concurrent: true # TCP 并发连接所有 IP, 将使用最快握手的 TCP

profile: # 储存 API 对策略组的选择，以供下次启动时使用
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

# 嗅探域名 可选配置
sniffer:
  enable: true
  ## 对 redir-host 类型识别的流量进行强制嗅探
  ## 如：Tun、Redir 和 TProxy 并 DNS 为 redir-host 皆属于
  force-dns-mapping: true
  ## 对所有未获取到域名的流量进行强制嗅探
  parse-pure-ip: true
  # 是否使用嗅探结果作为实际访问，默认 true
  # 全局配置，优先级低于 sniffer.sniff 实际配置
  override-destination: true
  sniff: # TLS 和 QUIC 默认如果不配置 ports 默认嗅探 443
    # 默认嗅探 80
    HTTP: # 需要嗅探的端口
      ports: [80, 8080-8880]
      # 可覆盖 sniffer.override-destination
      override-destination: true
    TLS:
      ports: [443, 8443]
    QUIC:
      ports: [443, 8443]
  force-domain:
    - '+.v2ex.com'
  ## 对嗅探结果进行跳过
  skip-domain:
    - "Mijia Cloud"
    - "dlg.io.mi.com"
    - "+.push.apple.com"
    - "+.apple.com"

# DNS 配置
dns:
  cache-algorithm: arc
  enable: true # 关闭将使用系统 DNS
  prefer-h3: true # 是否开启 DoH 支持 HTTP/3，将并发尝试
  listen: 0.0.0.0:53 # 开启 DNS 服务器监听
  ipv6: true # 启用IPv6解析
  ipv6-timeout: 300 # 单位：ms，内部双栈并发时，向上游查询 AAAA 时，等待 AAAA 的时间，默认 100ms
  enhanced-mode: fake-ip # 模式：redir-host或fake-ip
  fake-ip-range: 198.18.0.1/16 # fake-ip 池设置
  use-hosts: true # 查询 hosts
  # 配置不使用 fake-ip 的域名
  fake-ip-filter:
      # LAN
    - '*.lan'
    - '*.localdomain'
    - '*.example'
    - '*.invalid'
    - '*.localhost'
    - '*.test'
    - '*.local'
    - '*.home.arpa'
      # 放行NTP服务
    - 'time.*.com'
    - 'time.*.gov'
    - 'time.*.edu.cn'
    - 'time.*.apple.com'
    - 'time-ios.apple.com'
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
      # 放行网易云音乐
    - 'music.163.com'
    - '*.music.163.com'
    - '*.126.net'
      # 百度音乐
    - 'musicapi.taihe.com'
    - 'music.taihe.com'
      # 酷狗音乐
    - 'songsearch.kugou.com'
    - 'trackercdn.kugou.com'
      # 酷我音乐
    - '*.kuwo.cn'
      # JOOX音乐
    - 'api-jooxtt.sanook.com'
    - 'api.joox.com'
    - 'joox.com'
      # QQ音乐
    - 'y.qq.com'
    - '*.y.qq.com'
    - 'streamoc.music.tc.qq.com'
    - 'mobileoc.music.tc.qq.com'
    - 'isure.stream.qqmusic.qq.com'
    - 'dl.stream.qqmusic.qq.com'
    - 'aqqmusic.tc.qq.com'
    - 'amobile.music.tc.qq.com'
      # 虾米音乐
    - '*.xiami.com'
      # 咪咕音乐
    - '*.music.migu.cn'
    - 'music.migu.cn'
      # win10本地连接检测
    - '+.msftconnecttest.com'
    - '+.msftncsi.com'
      # QQ登录
    - 'localhost.ptlogin2.qq.com'
    - 'localhost.sec.qq.com'
    - '+.qq.com'
    - '+.tencent.com'
      # Game
      # Steam
    - '+.steamcontent.com'
      # Nintendo Switch
    - '+.srv.nintendo.net'
    - '*.n.n.srv.nintendo.net'
    - '+.cdn.nintendo.net'
      # Sony PlayStation
    - '+.stun.playstation.net'
      # Microsoft Xbox
    - 'xbox.*.*.microsoft.com'
    - '*.*.xboxlive.com'
    - 'xbox.*.microsoft.com'
    - 'xnotify.xboxlive.com'
      # Wotgame
    - '+.battlenet.com.cn'
    - '+.wotgame.cn'
    - '+.wggames.cn'
    - '+.wowsgame.cn'
    - '+.wargaming.net'
      # Golang
    - 'proxy.golang.org'
      # STUN
    - 'stun.*.*'
    - 'stun.*.*.*'
    - '+.stun.*.*'
    - '+.stun.*.*.*'
    - '+.stun.*.*.*.*'
    - '+.stun.*.*.*.*.*'
      # Linksys Router
    - 'heartbeat.belkin.com'
    - '*.linksys.com'
    - '*.linksyssmartwifi.com'
      # ASUS Router
    - '*.router.asus.com'
      # Apple Software Update Service
    - 'mesu.apple.com'
    - 'swscan.apple.com'
    - 'swquery.apple.com'
    - 'swdownload.apple.com'
    - 'swcdn.apple.com'
    - 'swdist.apple.com'
      # Google
    - 'lens.l.google.com'
    - 'stun.l.google.com'
    - 'na.b.g-tun.com'
      # Netflix
    - '+.nflxvideo.net'
      # FinalFantasy XIV Worldwide Server & CN Server
    - '*.square-enix.com'
    - '*.finalfantasyxiv.com'
    - '*.ffxiv.com'
    - '*.ff14.sdo.com'
    - 'ff.dorado.sdo.com'
      # Bilibili
    - '*.mcdn.bilivideo.cn'
      # Disney Plus
    - '+.media.dssott.com'
      # shark007 Codecs 
    - 'shark007.net'
      # Mijia
    - 'Mijia Cloud'
      # Xiaomi
    - '+.market.xiaomi.com'
      # 招商银行
    - '+.cmbchina.com'
    - '+.cmbimg.com'
      # AdGuard
    - 'adguardteam.github.io'
    - 'adrules.top'
    - 'anti-ad.net'
    - 'local.adguard.org'
    - 'static.adtidy.org'
      # 迅雷
    - '+.sandai.net'
    - '+.n0808.com'
      # T-mobile and Ultra Mobile wifi calling
    - '+.3gppnetwork.org'
      # UU Plugin
    - '+.uu.163.com'
    - 'ps.res.netease.com'
      # 向日葵远程控制
    - '+.oray.com'
    - '+.orayimg.com'
    - 'WORKGROUP'
      # FCM
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
  default-nameserver:  # 基础DNS服务器，用于解析其他DNS服务器的地址
    - 223.5.5.5  # 阿里 DNS
    - 223.6.6.6  # 阿里 DNS
    - 119.29.29.29  # 腾讯 DNS
    - 180.184.1.1  # 字节 DNS
  proxy-server-nameserver:  # 专用于节点域名解析的 DNS 服务器
    - 223.5.5.5  # 阿里 DNS
    - 223.6.6.6  # 阿里 DNS
    - 119.29.29.29  # 腾讯 DNS
    - 180.184.1.1  # 字节 DNS
  nameserver:  # 主要DNS服务器列表
    - https://dns.alidns.com/dns-query  # 阿里 DoH
    - https://doh.pub/dns-query  # DNSPod DoH
  fallback:  # 国外域名DNS服务器
    - https://8.8.8.8/dns-query#PROXY  # Google DoH
    - https://dns.google/dns-query#PROXY   # Google DoH
    - https://1.1.1.1/dns-query#PROXY   # CloudFlare DoH
    - https://cloudflare-dns.com/dns-query#PROXY  # Cloudflare DoH
  fallback-filter:  # fallback触发条件
     geoip: true  # 启用 GeoIP
     geoip-code: CN  # 国家代码
     ipcidr: # 在这个网段内的 IP 地址会被考虑为被污染的 IP
       - 240.0.0.0/4  # 保留地址，检测 DNS 污染
     domain:
       - "*.google.com"  # Google相关域名    
       - "*.youtube.com"  # YouTube相关域名
       - "*.twitter.com"  # twitter相关域名
       - "*.telegram.org" # Telegram相关域名
