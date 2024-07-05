$(function () {
    var browser = {
        versions: function() {
            var u = navigator.userAgent;
            return {
                mobile: !!u.match(/AppleWebKit.*Mobile.*/),
                ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/),
                android: u.indexOf("Android") > -1 || u.indexOf("Linux") > -1,
                iPhone: u.indexOf("iPhone") > -1,
                iPad: u.indexOf("iPad") > -1,
                browserName:(function(){
                    if (u.indexOf("MSIE") >= 0) {
                        return "Internet Explorer 10  Or Earlier"; //IE
                    } else if (u.indexOf("Firefox") >= 0) {
                        return "Firefox";
                    } else if (u.indexOf("Chrome") >= 0) {
                        var temp = "Chrome";
                        if (u.indexOf("360SE") >= 0) { //360安全浏览器
                            temp = "360SE";
                        } else if (u.indexOf("360EE") >= 0) { //360急速浏览器
                            temp = "360EE";
                        } else if (u.indexOf("SE") >= 0 && u.indexOf("360SE") == -1) { //搜狗浏览器
                            temp = "SouGou";
                        } else if (u.indexOf("Maxthon") >= 0) { //遨游浏览器
                            temp = "Maxthon";
                        }
                        return temp;
                    } else if (u.indexOf("UCBrowser") >= 0 || u.indexOf("UCWEB") >= 0) { // UC浏览器
                        return "UCBrowser";
                    } else if (u.indexOf("Opera") >= 0) {
                        return "Opera";
                    } else if (u.indexOf("Safari") >= 0) { // 苹果浏览器
                        return "Safari";
                    } else if (u.indexOf("Netscape") >= 0) {
                        return "Netscape";
                    } else if (u.indexOf("like Gecko") >= 0 && u.indexOf("Trident") >= 0) {
                        return "Internet Explorer 11 Or Later"; //IE11 以后，不再用 MSIE
                    } else {
                        return "Other Broswer";
                    }
                })()
            };
        } (),
        language: (navigator.browserLanguage || navigator.language).toLowerCase()
    };
    //判断终端
    console.log("userAgent 内容: " + navigator.userAgent );
    console.log("是否为移动终端: " + browser.versions.mobile);
    console.log("是否 ios: " + browser.versions.ios);
    console.log("是否 android: " + browser.versions.android);
    console.log("浏览器名称: " + browser.versions.browserName);

    if(browser.versions.mobile){
        layer.msg('该系统不推荐使用移动端进行访问!', {icon: 1});
        return false;
    }

    if(browser.versions.browserName!="Chrome" && browser.versions.browserName!="Firefox" ){
        layer.msg('抱歉您使用的浏览器不推荐,我们推荐使用谷歌和火狐浏览器进行操作', {icon: 3,shift:6});
    }



});