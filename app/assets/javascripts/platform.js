/*-
* Custom Js methods are binded under namespace
* You can't acccess any method without namespace
* To access a method just type -- SnmPlatformJS.platforms.methodname(<parameters>)
* Methods are related to get the devise on which currnty running, like android, ios and so on.
-*/

var SnmPlatformJS = SnmPlatformJS || {};
SnmPlatformJS = (function($, window, document, snm){
  snm.platforms ={
    android: function(){
      return navigator.userAgent.match(/Android/i);
    },
    iOS: function(){
      return navigator.userAgent.match(/iPhone|iPad|iPod/i);
    },
    windows: function(){
      return /IEMobile/i.test(navigator.userAgent);
    },
    blackBerry: function(){
      return /BlackBerry/i.test(navigator.userAgent);
    },
    isMobile: function(){
      return /Android|IEMobile|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent);
    }
  };
  return snm;
})(jQuery, this, this.document, SnmPlatformJS);