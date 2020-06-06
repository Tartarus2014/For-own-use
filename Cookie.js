# LOON获取Cookie订阅
# 该订阅仅适用于定时签到脚本的Cookie获取. 
# 您可以在使用后手动将其禁用，以免产生不必要的MITM.

hostname = api.m.jd.com,*.iqiyi.com


# > 京东签到获取cookie  （api.m.jd.com）
http-request https:\/\/api\.m\.jd\.com\/client\.action.*functionId=signBean(Index|GroupStageIndex) max-size=0,script-path=https://raw.githubusercontent.com/NobyDa/Script/master/JD-DailyBonus/JD_DailyBonus.js

# > 爱奇艺获取cookie   （*.iqiyi.com）
http-request https?:\/\/.*\.iqiyi\.com\/.*authcookie= script-path=https://raw.githubusercontent.com/NobyDa/Script/master/iQIYI-DailyBonus/iQIYI.js
