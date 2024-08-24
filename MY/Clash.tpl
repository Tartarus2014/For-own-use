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

# 设置日志输出级别 (默认级别：silent，即不输出任何内容，以避免因日志内容过大而导致程序内存溢出）。
# 5 个级别：silent / error / warning / info / debug。级别越高日志输出量越大，越倾向于调试，若需要请自行开启。
log-level: silent

# Clash 的 RESTful API
external-controller: '127.0.0.1:9090'
hosts:
  'mtalk.google.com': 142.250.157.188
  'alt1-mtalk.google.com': 142.250.157.188
  'alt2-mtalk.google.com': 142.250.115.188  
  'alt3-mtalk.google.com': 108.177.97.188
  'alt4-mtalk.google.com': 173.194.202.188 
  'alt5-mtalk.google.com': 142.250.141.188
  'alt6-mtalk.google.com': 142.250.115.188 
  'alt7-mtalk.google.com': 142.250.141.188
  'alt8-mtalk.google.com': 142.250.152.188
  'dl.google.com': 180.163.151.161
  'dl.l.google.com': 180.163.150.33
dns:
  enable: true # 是否启用dns false
  ipv6: true
  listen: 0.0.0.0:53
  default-nameserver:
    - 180.184.1.1  # 字节 DNS
    - 223.5.5.5  # 阿里 DNS
    - 223.6.6.6  # 阿里 DNS
  enhanced-mode: fake-ip # 模式：redir-host或fake-ip
  fake-ip-range: 198.18.0.1/16 #
  fake-ip-filter: # fake ip 白名单列表，如果你不知道这个参数的作用，请勿修改
    - "*.lan"
    - "*.localdomain"
    - "*.example"
    - "*.invalid"
    - "*.localhost"
    - "*.test"
    - "*.local"
    - "*.home.arpa"
    - time.*.com
    - time.*.gov
    - time.*.edu.cn
    - time.*.apple.com
    - time-ios.apple.com
    - time1.*.com
    - time2.*.com
    - time3.*.com
    - time4.*.com
    - time5.*.com
    - time6.*.com
    - time7.*.com
    - ntp.*.com
    - ntp1.*.com
    - ntp2.*.com
    - ntp3.*.com
    - ntp4.*.com
    - ntp5.*.com
    - ntp6.*.com
    - ntp7.*.com
    - "*.time.edu.cn"
    - "*.ntp.org.cn"
    - "+.pool.ntp.org"
    - time1.cloud.tencent.com
    - music.163.com
    - "*.music.163.com"
    - "*.126.net"
    - musicapi.taihe.com
    - music.taihe.com
    - songsearch.kugou.com
    - trackercdn.kugou.com
    - "*.kuwo.cn"
    - api-jooxtt.sanook.com
    - api.joox.com
    - joox.com
    - y.qq.com
    - "*.y.qq.com"
    - streamoc.music.tc.qq.com
    - mobileoc.music.tc.qq.com
    - isure.stream.qqmusic.qq.com
    - dl.stream.qqmusic.qq.com
    - aqqmusic.tc.qq.com
    - amobile.music.tc.qq.com
    - "*.xiami.com"
    - "*.music.migu.cn"
    - music.migu.cn
    - "+.msftconnecttest.com"
    - "+.msftncsi.com"
    - localhost.ptlogin2.qq.com
    - localhost.sec.qq.com
    - "+.qq.com"
    - "+.tencent.com"
    - "+.srv.nintendo.net"
    - "*.n.n.srv.nintendo.net"
    - "+.stun.playstation.net"
    - xbox.*.*.microsoft.com
    - "*.*.xboxlive.com"
    - xbox.*.microsoft.com
    - xnotify.xboxlive.com
    - "+.battlenet.com.cn"
    - "+.wotgame.cn"
    - "+.wggames.cn"
    - "+.wowsgame.cn"
    - "+.wargaming.net"
    - proxy.golang.org
    - stun.*.*
    - stun.*.*.*
    - "+.stun.*.*"
    - "+.stun.*.*.*"
    - "+.stun.*.*.*.*"
    - "+.stun.*.*.*.*.*"
    - heartbeat.belkin.com
    - "*.linksys.com"
    - "*.linksyssmartwifi.com"
    - "*.router.asus.com"
    - mesu.apple.com
    - swscan.apple.com
    - swquery.apple.com
    - swdownload.apple.com
    - swcdn.apple.com
    - swdist.apple.com
    - lens.l.google.com
    - stun.l.google.com
    - na.b.g-tun.com
    - "+.nflxvideo.net"
    - "*.square-enix.com"
    - "*.finalfantasyxiv.com"
    - "*.ffxiv.com"
    - "*.ff14.sdo.com"
    - ff.dorado.sdo.com
    - "*.mcdn.bilivideo.cn"
    - "+.media.dssott.com"
    - shark007.net
    - Mijia Cloud
    - "+.cmbchina.com"
    - "+.cmbimg.com"
    - local.adguard.org
    - "+.sandai.net"
    - "+.n0808.com"
    - "+.dns.google"
    - "+.dns.cloudflare.com"
    - "+.dns10.quad9.net"
    - "+.dns.alidns.com"
    - "+.dns.adguard-dns.com"
    - "+.public.dns.iij.jp"
    - "+.doh.360.cn"
    - "+.dns.twnic.tw"
    - "+.jd.com"
    - "+.weibo.com"
    - "+.cowtransfer.com"
    - "+.battle.net"
  nameserver:
    - https://223.5.5.5/dns-query  # 阿里 DoH
    - https://223.6.6.6/dns-query  # 阿里 DoH
  fallback:
    - tls://dns.google:853  # Google DoT
    - https://1.1.1.1/dns-query  # CloudFlare DoH
    - https://8.8.8.8/dns-query  # Google DoH
  fallback-filter:
     geoip: true # 默认
     geoip-code: CN  # GEOIP 地區
     ipcidr: # 在这个网段内的 IP 地址会被考虑为被污染的 IP
       - 240.0.0.0/4
     domain:
       - "+.google.com"
       - "+.facebook.com"
       - "+.youtube.com"
       - "+.crisp.chat"
       - "+.githubusercontent.com"
       - "+.googlevideo.com"
       - "+.msftconnecttest.com"
       - "+.msftncsi.com"
       - msftconnecttest.com
       - msftncsi.com
     nameserver-policy:
       "*.msftconnecttest.com": https://223.5.5.5/dns-query
       "*.msftncsi.com": https://223.5.5.5/dns-query
       '*.annas-archive.org': https://1.1.1.1/dns-query
