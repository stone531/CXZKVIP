var hzGuestKey = "hz_guest_key";
var clickurl = "//stat.hzins.com/stat/capture?";
function CaptureObject(a, b) {
    this.tag = a;
    this.type = b
}
function objevent(array, objevent, objfun) {
    if (objevent == "") {
        objevent = "onclick"
    } else {
        var objevent = String(objevent)
    }
    var objfun = String(objfun);
    var thisevent = function(evt) {
        evt = evt || window.event;
        var obj = evt.target || evt.srcElement;
        var tag = String(obj.tagName);
        var type = String(obj.getAttribute("type"));
        var checkTarget = false;
        try {
            if (Object.prototype.toString.call(array) === "[object Array]") {
                for (var i = 0; i < array.length; i++) {
                    var capObj = array[i];
                    var capObjTag = capObj.tag;
                    var capObjType = capObj.type;
                    if (capObjType != undefined) {
                        if (tag == capObjTag && type == capObjType) {
                            checkTarget = true
                        } else {
                            if (obj.parentNode.tagName == capObjTag && type == obj.parentNode.capObjType) {
                                obj = obj.parentNode;
                                checkTarget = true
                            } else {
                                if (obj.parentNode.parentNode.tagName == capObjTag && type == obj.parentNode.parentNode.capObjType) {
                                    obj = obj.parentNode.parentNode;
                                    checkTarget = true
                                } else {
                                    if (obj.parentNode.parentNode.parentNode.tagName == capObjTag && type == obj.parentNode.parentNode.parentNode.capObjType) {
                                        obj = obj.parentNode.parentNode.parentNode;
                                        checkTarget = true
                                    } else {
                                        continue
                                    }
                                }
                            }
                        }
                    } else {
                        if (tag == capObjTag) {
                            checkTarget = true
                        } else {
                            if (obj.parentNode.tagName == capObjTag) {
                                obj = obj.parentNode;
                                checkTarget = true
                            } else {
                                if (obj.parentNode.parentNode.tagName == capObjTag) {
                                    obj = obj.parentNode.parentNode;
                                    checkTarget = true
                                } else {
                                    if (obj.parentNode.parentNode.parentNode.tagName == capObjTag) {
                                        obj = obj.parentNode.parentNode.parentNode;
                                        checkTarget = true
                                    } else {
                                        continue
                                    }
                                }
                            }
                        }
                    }
                }
            }
            if (!checkTarget) {
                return
            }
            eval(objfun)(obj)
        } catch(e) {}
    };
    var thiseventtemp = "document.body." + objevent + "=" + thisevent;
    eval(thiseventtemp)
}
function genTjId(a) {
    if (a.xlTjId) {
        return a.xlTjId
    }
    if (a.id) {
        return a.id
    }
    return genIdByDom(a, 0)
}
function genIdByDom(a, b, f) {
    try {
        while (a.tagName == "TBODY" || a.tagName == "THEAD") {
            a = a.parentNode
        }
        var d;
        if (!a || a.tagName == "BODY" || a.tagName == "HTML" || a.tagName == "HEAD") {
            return ""
        } else {
            if (a.id && a.id != "") {
                return a.id
            }
            if (a.name && a.name != "") {
                return a.name
            }
            if (a.xlTjId && a.xlTjId != "") {
                return a.xlTjId
            }
            d = a.tagName
        }
        if (!a.parentNode) {
            return d
        }
        return genIdByDom(a.parentNode, b + 1, f) + "_" + d + "[" + getIndexInSibling(a) + "]"
    } catch(c) {
        return ""
    }
}
function getIndexInSibling(d) {
    var c = d;
    var b = d;
    var a = 0;
    while (c.previousSibling && c.previousSibling != "") {
        c = c.previousSibling;
        if (b.tagName == c.tagName) {
            a++
        }
    }
    return a
}
var hz_stat_clickImg = new Image();
var clickpage = null;
function clickpgv() {
    r = document.URL;
    var a = r.indexOf("?");
    if (a > 0) {
        r = r.substring(0, a)
    }
    return encodeURIComponent(r)
}
try {
    clickpage = clickpgv()
} catch(e) {}
try {
    var hz_click_pv_clickon_handler = function() {
        var d = new CaptureObject("A");
        var c = new CaptureObject("BUTTON");
        var a = new CaptureObject("INPUT", "button");
        var b = [d, c, a];
        objevent(b, "onclick", "hz_clickon")
    };
    function hz_click_pv_rebind_capture() {
        if (window.attachEvent) {
            window.detachEvent("onload", hz_click_pv_clickon_handler);
            window.attachEvent("onload", hz_click_pv_clickon_handler)
        } else {
            window.removeEventListener("load", hz_click_pv_clickon_handler, true);
            window.addEventListener("load", hz_click_pv_clickon_handler, true)
        }
    }
    hz_click_pv_rebind_capture()
} catch(e) {}
function getCookieByKey(b) {
    if (document.cookie.length > 0) {
        var a = document.cookie.indexOf(b + "=");
        if (a != -1) {
            a = a + b.length + 1;
            var c = document.cookie.indexOf(";", a);
            if (c == -1) {
                c = document.cookie.length
            }
            return unescape(document.cookie.substring(a, c))
        }
    }
    return ""
}
function getGuestId() {
    var a = getCookieByKey(hzGuestKey);
    if (a != null && a.length > 0) {
        var b = a.split("_");
        if (b.length >= 6) {
            return b[0]
        } else {
            return ""
        }
    } else {
        return ""
    }
}
function hz_clickon(d) {
    try {
        var g = "";
        try {
            if (_hzq.gsId != undefined) {
                g = _hzq.gsId
            }
        } catch(a) {
            g = "GSID_000_000"
        }
        var f = genTjId(d);
        var c = getGuestId();
        hz_stat_clickImg.src = clickurl + "ld=" + f + "&gd=" + c + "&ul=" + clickpage + "&gs=" + g + "&t=" + (Math.random() * 100000);
        if ((d.tagName == "A" && d.target != "_blank") || d.tagName != "A") {
            wait(200)
        }
    } catch(b) {}
}
function wait(c) {
    var b = new Date();
    var a = null;
    do {
        a = new Date()
    } while ( a . getTime () - b.getTime() < c)
};