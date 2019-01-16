function setCookie(name,value,expiredays) {
	var exp=new Date();
	exp.setDate(exp.getDate()+expiredays);
	document.cookie=name+"="+escape(value)+((expiredays==null)?"":";expires="+exp.toGMTString());
}
function getCookie(name) {
	var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
	if (arr=document.cookie.match(reg)) return unescape(arr[2]);
	else return null;
}
function removeCookie(name) {
	var exp = new Date();
	exp.setTime(exp.getTime() - 1);
	var cval=getCookie(name);
	if (cval!=null) document.cookie= name + "="+cval+";expires="+exp.toGMTString();
}
