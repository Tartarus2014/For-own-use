#响应类脚本
#破解部分app vip及去除应用内广告
#需配合主机名共同使用

hostname = mp.weixin.qq.com, api.gamer.com.tw, api.weibo.cn, mapi.weibo.com, *.uve.weibo.com

# 微信去广告 （mp.weixin.qq.com）
http-response ^https?:\/\/mp\.weixin\.qq\.com\/mp\/getappmsgad requires-body=1,max-size=0,script-path=https://raw.githubusercontent.com/NobyDa/Script/master/QuantumultX/File/Wechat.js

# Bahamut （api.gamer.com.tw）
http-request https:\/\/api\.gamer\.com\.tw\/mobile_app\/anime\/v3\/token\.php script-path=https://raw.githubusercontent.com/NobyDa/Script/master/Surge/JS/Bahamut.js
http-response https:\/\/api\.gamer\.com\.tw\/mobile_app\/anime\/v3\/token\.php requires-body=1,max-size=0,script-path=https://raw.githubusercontent.com/NobyDa/Script/master/Surge/JS/Bahamut.js

# 微博 (api.weibo.cn, mapi.weibo.com, *.uve.weibo.com)
http-response ^https?://(sdk|wb)app\.uve\.weibo\.com(/interface/sdk/sdkad.php|/wbapplua/wbpullad.lua) requires-body=1,script-path=https://raw.githubusercontent.com/yichahucha/surge/master/wb_launch.js
http-response ^https?://m?api\.weibo\.c(n|om)/2/(statuses/(unread|extend|positives/get|(friends|video)(/|_)(mix)?timeline)|stories/(video_stream|home_list)|(groups|fangle)/timeline|profile/statuses|comments/build_comments|photo/recommend_list|service/picfeed|searchall|cardlist|page|!/photos/pic_recommend_status|video/tiny_stream_video_list) requires-body=1,max-size=-1,script-path=https://raw.githubusercontent.com/yichahucha/surge/master/wb_ad.js
