# 按需求自己选择和修改时间
# 定时脚本

# > 京东--浏览器登录 https://bean.m.jd.com
cron "10 2 0 * * *" script-path=https://raw.githubusercontent.com/NobyDa/Script/master/JD-DailyBonus/JD_DailyBonus.js,tag=京东签到

# > 爱奇艺
cron "50 3 0 * * *" script-path=https://raw.githubusercontent.com/NobyDa/Script/master/iQIYI-DailyBonus/iQIYI.js,tag=爱奇艺签到
