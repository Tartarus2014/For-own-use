# 按需求自己选择和修改时间
# 定时脚本

# 京东--浏览器登录 https://bean.m.jd.com
cron "3 0 * * *" script-path=https://raw.githubusercontent.com/NobyDa/Script/master/JD-DailyBonus/JD_DailyBonus.js,tag=京东签到

# 爱奇艺
cron "3 0 * * *" script-path=https://raw.githubusercontent.com/NobyDa/Script/master/iQIYI-DailyBonus/iQIYI.js,tag=爱奇艺签到

# Bilibili
cron "2 0 0 * *" script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/bilibili/bilibili.js
# 如需银瓜子转硬币，添加以下内容 
cron "2 0 0 * *" script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/bilibili/bilibili.silver2coin.js

# Acfun
cron "2 0 0 * *" script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/acfun/acfun.js

# 中国联通
cron "2 0 * * *" script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/10010/10010.js

# 京东到家
cron "2 0 * * *" script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/jddj/jddj.js

# 美团
cron "3 0 * * *" script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/meituan/meituan.js

# 网易云音乐
cron "3 0 * * *" script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/neteasemusic/neteasemusic.js

# 苏宁
cron "3 0 * * *" script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/suning/suning.js

# 腾讯视频
cron "3 0 * * *" script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/videoqq/videoqq.js

# 美团外卖
cron "3 0 * * *" script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/wmmeituan/wmmeituan.js

# 字幕组
cron "4 0 * * *" script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/zimuzu/zimuzu.js

# 来客有礼
cron "0 */6 * * *" script-path=https://raw.githubusercontent.com/Sunert/Scripts/master/Task/lkyl.js, enabled=true, tag=来客有礼

# 饿了么
cron "4 0 0 * * *" script-path=https://raw.githubusercontent.com/songyangzz/QuantumultX/master/elem/elemSign.js

# 微博
cron "9 0 * * *" script-path=https://raw.githubusercontent.com/Sunert/Scripts/master/Task/weibo.js
