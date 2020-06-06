# LOON获取Cookie订阅
# 该订阅仅适用于定时签到脚本的Cookie获取. 
# 您可以在使用后手动将其禁用，以免产生不必要的MITM.

hostname = manga.bilibili.com,api.m.jd.com

# > B站漫画获取cookie
http-request https:\/\/manga\.bilibili\.com\/.*\.User\/GetWallet max-size=0,script-path=https://raw.githubusercontent.com/NobyDa/Script/master/Bilibili-DailyBonus/Manga.js
# > B站直播获取Cookie
http-request ^https:\/\/(www|live)\.bilibili\.com\/?.? script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/bilibili/bilibili.cookie.js

# > 京东签到获取cookie
http-request https:\/\/api\.m\.jd\.com\/client\.action.*functionId=signBean(Index|GroupStageIndex) max-size=0,script-path=https://raw.githubusercontent.com/NobyDa/Script/master/JD-DailyBonus/JD_DailyBonus.js
