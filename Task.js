# 按需求自己选择和修改时间
# 定时脚本


# > B站直播--打开浏览器访问: https://www.bilibili.com 或 https://live.bilibili.com
cron "20 1 0 * * *" script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/bilibili/bilibili.js,tag=B站直播
cron "30 1 8 * * *" script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/bilibili/bilibili.silver2coin.js,tag=银瓜子转硬币

# > B站漫画
cron "40 1 0 * * *" script-path=https://raw.githubusercontent.com/NobyDa/Script/master/Bilibili-DailyBonus/Manga.js,tag=B站漫画

# > 京东--浏览器登录 https://bean.m.jd.com
cron "10 2 0 * * *" script-path=https://raw.githubusercontent.com/NobyDa/Script/master/JD-DailyBonus/JD_DailyBonus.js,tag=京东签到
