# ZhiHu Ads

hostname = api.zhihu.com, www.zhihu.com

# 知乎 （api.zhihu.com, www.zhihu.com）
http-response https://api.zhihu.com/moments/recommend script-path=https://raw.githubusercontent.com/onewayticket255/Surge-Script/master/surge%20zhihu%20feed.js, requires-body=true, timeout=10, tag=知乎
http-response https://api.zhihu.com/topstory/recommend script-path=https://raw.githubusercontent.com/onewayticket255/Surge-Script/master/surge%20zhihu%20recommend.js, requires-body=true, timeout=10, tag=知乎
http-response https://api.zhihu.com/v4/questions script-path=https://raw.githubusercontent.com/onewayticket255/Surge-Script/master/surge%20zhihu%20answer.js, requires-body=true, timeout=10, tag=知乎
http-response https://api.zhihu.com/people/ script-path=https://raw.githubusercontent.com/onewayticket255/Surge-Script/master/surge%20zhihu%20people.js, requires-body=true, timeout=10, tag=知乎
