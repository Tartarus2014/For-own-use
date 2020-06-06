# LOON获取Cookie订阅
# 该订阅仅适用于定时签到脚本的Cookie获取. 
# 您可以在使用后手动将其禁用，以免产生不必要的MITM.

hostname = api.m.jd.com

#京东签到 api.m.jd.com
http-request https:\/\/api\.m\.jd\.com\/client\.action.*functionId=signBean tag=获取京东Cookie, script-path=https://raw.githubusercontent.com/NobyDa/Script/master/JD-DailyBonus/JD_DailyBonus.js
