#响应类脚本
#破解部分app vip及去除应用内广告
#需配合主机名共同使用

hostname = mp.weixin.qq.com, api.gamer.com.tw, api.weibo.cn, mapi.weibo.com, *.uve.weibo.com, api.bilibili.com, app.bilibili.com, api.live.bilibili.com, www.zhihu.com, api.zhihu.com,link.zhihu.com, 118.89.204.198, ios.prod.ftl.netflix.com, trade-acs.m.taobao.com, api.m.jd.com

# 微信去广告 （mp.weixin.qq.com）
http-response ^https?:\/\/mp\.weixin\.qq\.com\/mp\/getappmsgad requires-body=1,max-size=0,script-path=https://raw.githubusercontent.com/NobyDa/Script/master/QuantumultX/File/Wechat.js

# Bahamut （api.gamer.com.tw）
http-request https:\/\/api\.gamer\.com\.tw\/mobile_app\/anime\/v3\/token\.php script-path=https://raw.githubusercontent.com/NobyDa/Script/master/Surge/JS/Bahamut.js
http-response https:\/\/api\.gamer\.com\.tw\/mobile_app\/anime\/v3\/token\.php requires-body=1,max-size=0,script-path=https://raw.githubusercontent.com/NobyDa/Script/master/Surge/JS/Bahamut.js

# 微博 (api.weibo.cn, mapi.weibo.com, *.uve.weibo.com)
http-response ^https?://(sdk|wb)app\.uve\.weibo\.com(/interface/sdk/sdkad.php|/wbapplua/wbpullad.lua) requires-body=1,script-path=https://raw.githubusercontent.com/yichahucha/surge/master/wb_launch.js
http-response ^https?://m?api\.weibo\.c(n|om)/2/(statuses/(unread|extend|positives/get|(friends|video)(/|_)(mix)?timeline)|stories/(video_stream|home_list)|(groups|fangle)/timeline|profile/statuses|comments/build_comments|photo/recommend_list|service/picfeed|searchall|cardlist|page|!/photos/pic_recommend_status|video/tiny_stream_video_list) requires-body=1,max-size=-1,script-path=https://raw.githubusercontent.com/yichahucha/surge/master/wb_ad.js

# 哔哩哔哩 精简&去广告 （api.bilibili.com, app.bilibili.com, api.live.bilibili.com）
# Up主收藏排行榜
http-response https://app.bilibili.com/x/v2/space\?access_key script-path=https://raw.githubusercontent.com/onewayticket255/Surge-Script/master/surge%20bilibili%20space.js
# 首页Tab
http-response https://app.bilibili.com/x/resource/show/tab\?access_key script-path=https://raw.githubusercontent.com/onewayticket255/Surge-Script/master/surge%20bilibili%20tab.js
http-response https://app.bilibili.com/x/v2/feed/index\?access_key script-path=https://raw.githubusercontent.com/onewayticket255/Surge-Script/master/surge%20bilibili%20feed.js
# 个人中心
http-response https://app.bilibili.com/x/v2/account/mine\?access_key script-path=https://raw.githubusercontent.com/onewayticket255/Surge-Script/master/surge%20bilibili%20account.js
http-response https://app.bilibili.com/x/v2/view\?access_key script-path=https://raw.githubusercontent.com/onewayticket255/Surge-Script/master/surge%20bilibili%20view%20relate.js
http-response https://api.bilibili.com/x/v2/reply/main\?access_key script-path=https://raw.githubusercontent.com/onewayticket255/Surge-Script/master/surge%20bilibili%20reply.js
http-response https://api.live.bilibili.com/xlive/app-room/v1/index/getInfoByRoom\?access_key script-path=https://raw.githubusercontent.com/onewayticket255/Surge-Script/master/surge%20bilibili%20live.js

# 知乎 （www.zhihu.com, api.zhihu.com, link.zhihu.com, 118.89.204.198）
http-response https://api.zhihu.com/moments/recommend script-path=https://raw.githubusercontent.com/onewayticket255/Surge-Script/master/surge%20zhihu%20feed.js
http-response https://api.zhihu.com/topstory/recommend script-path=https://raw.githubusercontent.com/onewayticket255/Surge-Script/master/surge%20zhihu%20recommend.js
http-response https://api.zhihu.com/v4/questions script-path=https://raw.githubusercontent.com/onewayticket255/Surge-Script/master/surge%20zhihu%20answer.js
http-response https://api.zhihu.com/people/ script-path=https://raw.githubusercontent.com/onewayticket255/Surge-Script/master/surge%20zhihu%20people.js
http-request https?://link.zhihu.com/\?target= script-path=https://raw.githubusercontent.com/onewayticket255/Surge-Script/master/surge%20zhihu%20link.js

# Display netflix ratings(ios.prod.ftl.netflix.com)
http-request ^https?://ios\.prod\.ftl\.netflix\.com/iosui/user/.+path=%5B%22videos%22%2C%\d+%22%2C%22summary%22%5D script-path=https://raw.githubusercontent.com/yichahucha/surge/master/nf_rating.js
http-response ^https?://ios\.prod\.ftl\.netflix\.com/iosui/user/.+path=%5B%22videos%22%2C%\d+%22%2C%22summary%22%5D requires-body=1,script-path=https://raw.githubusercontent.com/yichahucha/surge/master/nf_rating.js
http-response ^https?://ios\.prod\.ftl\.netflix\.com/iosui/warmer/.+type=show-ath script-path=https://raw.githubusercontent.com/yichahucha/surge/master/nf_rating_season.js

# 京东比价 (api.m.jd.com)
http-response ^https?://api\.m\.jd\.com/client\.action\?functionId=(wareBusiness|serverConfig) requires-body=1,script-path=https://raw.githubusercontent.com/yichahucha/surge/master/jd_price.js

# 淘宝比价 (trade-acs.m.taobao.com)
http-request ^http://.+/amdc/mobileDispatch requires-body=1,script-path=https://raw.githubusercontent.com/yichahucha/surge/master/tb_price.js
http-response ^https?://trade-acs\.m\.taobao\.com/gw/mtop\.taobao\.detail\.getdetail requires-body=1,script-path=https://raw.githubusercontent.com/yichahucha/surge/master/tb_price.js
