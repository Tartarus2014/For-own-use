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
  enable: true  # 启用DNS服务
  ipv6: true  # 启用IPv6解析
  listen: 0.0.0.0:53  # DNS服务监听地址和端口
  enhanced-mode: fake-ip # 模式：redir-host或fake-ip
  fake-ip-range: 198.18.0.1/16 #  # fake-ip地址池范围
  fake-ip-filter: # fake ip 白名单列表，如果你不知道这个参数的作用，请勿修改
    - '*.lan'  # 这些都是保留域名。
    - '*.localdomain'  # 这些都是保留域名。
    - '*.example'  # 这些都是保留域名。
    - '*.invalid'  # 这些都是保留域名。
    - '*.localhost'  # 这些都是保留域名。
    - '*.test'  # 这些都是保留域名。
    - '*.local'  # 这些都是保留域名。
    - '*.home.arpa'  # 这些都是保留域名。
    - 'time.*.com'  # 网络时间协议 (NTP) 服务器。
    - 'time.*.gov'  # 网络时间协议 (NTP) 服务器。
    - 'time.*.edu.cn'  # 网络时间协议 (NTP) 服务器。
    - 'time.*.apple.com'  # 网络时间协议 (NTP) 服务器。
    - 'time1.*.com'  # 网络时间协议 (NTP) 服务器。
    - 'time2.*.com'  # 网络时间协议 (NTP) 服务器。
    - 'time3.*.com'  # 网络时间协议 (NTP) 服务器。
    - 'time4.*.com'  # 网络时间协议 (NTP) 服务器。
    - 'time5.*.com'  # 网络时间协议 (NTP) 服务器。
    - 'time6.*.com'  # 网络时间协议 (NTP) 服务器。
    - 'time7.*.com'  # 网络时间协议 (NTP) 服务器。
    - 'ntp.*.com'  # 网络时间协议 (NTP) 服务器。
    - 'ntp1.*.com'  # 网络时间协议 (NTP) 服务器。
    - 'ntp2.*.com'  # 网络时间协议 (NTP) 服务器。
    - 'ntp3.*.com'  # 网络时间协议 (NTP) 服务器。
    - 'ntp4.*.com'  # 网络时间协议 (NTP) 服务器。
    - 'ntp5.*.com'  # 网络时间协议 (NTP) 服务器。
    - 'ntp6.*.com'  # 网络时间协议 (NTP) 服务器。
    - 'ntp7.*.com'  # 网络时间协议 (NTP) 服务器。
    - '*.time.edu.cn'  # 网络时间协议 (NTP) 服务器。
    - '*.ntp.org.cn'  # 网络时间协议 (NTP) 服务器。
    - '+.pool.ntp.org'  # 网络时间协议 (NTP) 服务器。
    - 'time1.cloud.tencent.com'  # 网络时间协议 (NTP) 服务器。
    - 'music.163.com'  # 网易云音乐。
    - '*.music.163.com'  # 网易云音乐。
    - '*.126.net'  # 网易云音乐。
    - 'musicapi.taihe.com'  # 太合音乐（百度音乐前身）。
    - 'music.taihe.com'  # 太合音乐（百度音乐前身）。
    - 'songsearch.kugou.com'  # 酷狗音乐
    - 'trackercdn.kugou.com'  # 酷狗音乐
    - '*.kuwo.cn'  # 酷我音乐。
    - 'api-jooxtt.sanook.com'  # JOOX（东南亚地区的音乐流媒体服务，腾讯旗下）。
    - 'api.joox.com'  # JOOX（东南亚地区的音乐流媒体服务，腾讯旗下）。
    - 'joox.com'  # JOOX（东南亚地区的音乐流媒体服务，腾讯旗下）。
    - 'y.qq.com'  # QQ音乐（腾讯音乐娱乐集团）。
    - '*.y.qq.com'  # QQ音乐（腾讯音乐娱乐集团）。
    - 'streamoc.music.tc.qq.com'  # QQ音乐（腾讯音乐娱乐集团）。
    - 'mobileoc.music.tc.qq.com'  # QQ音乐（腾讯音乐娱乐集团）。
    - 'isure.stream.qqmusic.qq.com'  # QQ音乐（腾讯音乐娱乐集团）。
    - 'dl.stream.qqmusic.qq.com'  # QQ音乐（腾讯音乐娱乐集团）。
    - 'aqqmusic.tc.qq.com'  # QQ音乐（腾讯音乐娱乐集团）。
    - 'amobile.music.tc.qq.com'  # QQ音乐（腾讯音乐娱乐集团）。
    - '*.xiami.com'  # 虾米音乐（已被阿里音乐关闭）。
    - '*.music.migu.cn'  # 咪咕音乐（中国移动旗下）。
    - 'music.migu.cn'  # 咪咕音乐（中国移动旗下）。
    - '*.msftconnecttest.com'  # 微软用于网络连接状态指示器 (NCSI) 的域名。
    - '*.msftncsi.com'  # 微软用于网络连接状态指示器 (NCSI) 的域名。
    - 'msftconnecttest.com'  # 微软用于网络连接状态指示器 (NCSI) 的域名。
    - 'msftncsi.com'  # 微软用于网络连接状态指示器 (NCSI) 的域名。
    - 'localhost.ptlogin2.qq.com'  # 腾讯QQ的本地登录和安全验证相关域名。
    - 'localhost.sec.qq.com'  # 腾讯QQ的本地登录和安全验证相关域名。
    - '+.srv.nintendo.net'  # 如果你需要Nintendo
    - '+.stun.playstation.net'  # 如果你需要 PlayStation
    - 'xbox.*.microsoft.com' # 如果你需要 Xbox
    - 'xnotify.xboxlive.com' # 如果你需要 Xbox
    - '+.battlenet.com.cn'  # 暴雪战网（中国）。
    - '+.wotgame.cn'  # 战争世界（空中网在中国运营）。
    - '+.wggames.cn'  # 战争世界（空中网在中国运营）。
    - '+.wowsgame.cn'  # 战争世界（空中网在中国运营）。
    - '+.wargaming.net'  # Wargaming（战争世界开发商）。
    - 'proxy.golang.org'  # Go语言模块代理服务器。
    - 'stun.*.*'  #  STUN (Session Traversal Utilities for NAT) 服务器用于帮助设备在 NAT 网络中建立连接，常用于VoIP和视频通话。
    - 'stun.*.*.*'  #  STUN (Session Traversal Utilities for NAT) 服务器用于帮助设备在 NAT 网络中建立连接，常用于VoIP和视频通话。
    - '+.stun.*.*'  #  STUN (Session Traversal Utilities for NAT) 服务器用于帮助设备在 NAT 网络中建立连接，常用于VoIP和视频通话。
    - '+.stun.*.*.*'  #  STUN (Session Traversal Utilities for NAT) 服务器用于帮助设备在 NAT 网络中建立连接，常用于VoIP和视频通话。
    - '+.stun.*.*.*.*'  #  STUN (Session Traversal Utilities for NAT) 服务器用于帮助设备在 NAT 网络中建立连接，常用于VoIP和视频通话。
    - 'heartbeat.belkin.com'  # 如果你需要 Belkin
    - '*.linksys.com'  # 如果你需要 Linksys
    - '*.linksyssmartwifi.com'  # 如果你需要 Linksys
    - '*.router.asus.com'  # 如果你需要 ASUS
    - 'mesu.apple.com'  # 苹果公司的软件更新服务器。
    - 'swscan.apple.com'  # 苹果公司的软件更新服务器。
    - 'swquery.apple.com'  # 苹果公司的软件更新服务器。
    - 'swdownload.apple.com'  # 苹果公司的软件更新服务器。
    - 'swcdn.apple.com'  # 苹果公司的软件更新服务器。
    - 'swdist.apple.com'  # 苹果公司的软件更新服务器。
    - 'lens.l.google.com'  # 谷歌 Lens 相关服务。
    - 'stun.l.google.com'  # 谷歌提供的STUN服务器。
    - '+.nflxvideo.net'  # Netflix 内容分发网络 (CDN)，用于更快地传输视频内容。
    - '*.square-enix.com'  # Square Enix 及其游戏最终幻想 XIV (FFXIV)。
    - '*.finalfantasyxiv.com'  # Square Enix 及其游戏最终幻想 XIV (FFXIV)。
    - '*.ffxiv.com'  # Square Enix 及其游戏最终幻想 XIV (FFXIV)。
    - '*.mcdn.bilivideo.cn'  # Bilibili 视频网站的媒体内容分发网络。
    - '+.media.dssott.com'  # 迪士尼流媒体服务的内容分发网络。
    - 'Mijia Cloud'  # 小米米家云服务，用于存储和同步米家智能设备的数据。
    - '+.cmbchina.com'  # 招商银行。
    - '+.cmbimg.com'  # 招商银行。
    - '+.sandai.net'  # 迅雷公司。sandai.net 是迅雷公司的域名。
    - '+.jd.com'  # 京东（JD.com），中国主要的电商平台。
    - '+.weibo.com'  # 新浪微博，中国流行的社交媒体平台。
    - '+.battle.net'  # 暴雪娱乐，著名的游戏开发和发行公司
    - '+.dns.google'  # 谷歌（Google）的公共 DNS 服务器。
    - '+.dns.cloudflare.com'  # Cloudflare 的公共 DNS 服务器。
    - '+.dns10.quad9.net'  # Quad9 的公共 DNS 服务器。
    - '+.dns.alidns.com'  # 阿里云（Alibaba Cloud）的公共 DNS 服务器。
    - '+.dns.adguard-dns.com'  # AdGuard 的 DNS 服务器。
    - '+.doh.dnspod.cn' # DNSPod 的 的 DNS 服务器。
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
      - 240.0.0.0/4  # 保留地址
    domain:
      - '+.google.com'  # Google相关域名    
      - '+.facebook.com'  # Facebook相关域名
      - '+.youtube.com'  # YouTube相关域名
