var $jscomp = $jscomp || {};
$jscomp.scope = {};
$jscomp.arrayIteratorImpl = function(c) {
  var n = 0;
  return function() {
    return n < c.length ? {done:!1, value:c[n++]} : {done:!0};
  };
};
$jscomp.arrayIterator = function(c) {
  return {next:$jscomp.arrayIteratorImpl(c)};
};
$jscomp.makeIterator = function(c) {
  var n = "undefined" != typeof Symbol && Symbol.iterator && c[Symbol.iterator];
  return n ? n.call(c) : $jscomp.arrayIterator(c);
};
$jscomp.arrayFromIterator = function(c) {
  for (var n, k = []; !(n = c.next()).done;) {
    k.push(n.value);
  }
  return k;
};
$jscomp.arrayFromIterable = function(c) {
  return c instanceof Array ? c : $jscomp.arrayFromIterator($jscomp.makeIterator(c));
};
$jscomp.owns = function(c, n) {
  return Object.prototype.hasOwnProperty.call(c, n);
};
$jscomp.assign = "function" == typeof Object.assign ? Object.assign : function(c, n) {
  for (var k = 1; k < arguments.length; k++) {
    var t = arguments[k];
    if (t) {
      for (var x in t) {
        $jscomp.owns(t, x) && (c[x] = t[x]);
      }
    }
  }
  return c;
};
$jscomp.ASSUME_ES5 = !1;
$jscomp.ASSUME_NO_NATIVE_MAP = !1;
$jscomp.ASSUME_NO_NATIVE_SET = !1;
$jscomp.SIMPLE_FROUND_POLYFILL = !1;
$jscomp.defineProperty = $jscomp.ASSUME_ES5 || "function" == typeof Object.defineProperties ? Object.defineProperty : function(c, n, k) {
  c != Array.prototype && c != Object.prototype && (c[n] = k.value);
};
$jscomp.getGlobal = function(c) {
  return "undefined" != typeof window && window === c ? c : "undefined" != typeof global && null != global ? global : c;
};
$jscomp.global = $jscomp.getGlobal(this);
$jscomp.polyfill = function(c, n, k, t) {
  if (n) {
    k = $jscomp.global;
    c = c.split(".");
    for (t = 0; t < c.length - 1; t++) {
      var x = c[t];
      x in k || (k[x] = {});
      k = k[x];
    }
    c = c[c.length - 1];
    t = k[c];
    n = n(t);
    n != t && null != n && $jscomp.defineProperty(k, c, {configurable:!0, writable:!0, value:n});
  }
};
$jscomp.polyfill("Object.assign", function(c) {
  return c || $jscomp.assign;
}, "es6", "es3");
$jscomp.checkStringArgs = function(c, n, k) {
  if (null == c) {
    throw new TypeError("The 'this' value for String.prototype." + k + " must not be null or undefined");
  }
  if (n instanceof RegExp) {
    throw new TypeError("First argument to String.prototype." + k + " must not be a regular expression");
  }
  return c + "";
};
$jscomp.polyfill("String.prototype.startsWith", function(c) {
  return c ? c : function(c, k) {
    var n = $jscomp.checkStringArgs(this, c, "startsWith");
    c += "";
    var x = n.length, p = c.length;
    k = Math.max(0, Math.min(k | 0, n.length));
    for (var C = 0; C < p && k < x;) {
      if (n[k++] != c[C++]) {
        return !1;
      }
    }
    return C >= p;
  };
}, "es6", "es3");
$jscomp.polyfill("Object.is", function(c) {
  return c ? c : function(c, k) {
    return c === k ? 0 !== c || 1 / c === 1 / k : c !== c && k !== k;
  };
}, "es6", "es3");
$jscomp.polyfill("Array.prototype.includes", function(c) {
  return c ? c : function(c, k) {
    var t = this;
    t instanceof String && (t = String(t));
    var n = t.length;
    k = k || 0;
    for (0 > k && (k = Math.max(k + n, 0)); k < n; k++) {
      var p = t[k];
      if (p === c || Object.is(p, c)) {
        return !0;
      }
    }
    return !1;
  };
}, "es7", "es3");
$jscomp.polyfill("String.prototype.includes", function(c) {
  return c ? c : function(c, k) {
    return -1 !== $jscomp.checkStringArgs(this, c, "includes").indexOf(c, k || 0);
  };
}, "es6", "es3");
var onlyStock = !1, scanner = function() {
  function c(c, k, p, n, D, z) {
    var t = new XMLHttpRequest, b = !1, x = setTimeout(function() {
      b = !0;
      z();
    }, n || 4000);
    t.onreadystatechange = function() {
      b || (clearTimeout(x), D(t));
    };
    t.onerror = z;
    t.open(k, c, !0);
    null == p ? t.send() : t.send(p);
  }
  function n(k, n) {
    var p = {};
    if (null == document.body) {
      p.status = 599, n(p);
    } else {
      if (document.body.textContent.match(/you're not a robot/)) {
        p.status = 403, n(p);
      } else {
        for (var t = document.evaluate("//comment()", document, null, XPathResult.ANY_TYPE, null), x = t.iterateNext(), z = ""; x;) {
          z += x, x = t.iterateNext();
        }
        if (z.match(/automated access/)) {
          p.status = 403, n(p);
        } else {
          if (z.match(/ref=cs_503_link/)) {
            p.status = 503, n(p);
          } else {
            var v = 0;
            if (k.scrapeFilters && 0 < k.scrapeFilters.length) {
              t = {};
              x = null;
              var b = "", A = null, w = {}, a = {}, h = !1, l = function(a, d, f) {
                var g = [];
                if (!a.selector) {
                  if (!a.regExp) {
                    return b = "invalid selector, sel/regexp", !1;
                  }
                  var e = document.getElementsByTagName("html")[0].innerHTML.match(new RegExp(a.regExp, "i"));
                  if (!e || e.length < a.reGroup) {
                    e = "regexp fail: html - " + a.name + f;
                    if (!1 === a.optional) {
                      return b = e, !1;
                    }
                    A += " // " + e;
                    return !0;
                  }
                  return e[a.reGroup];
                }
                e = d.querySelectorAll(a.selector);
                0 == e.length && (e = d.querySelectorAll(a.altSelector));
                if (0 == e.length) {
                  if (!0 === a.optional) {
                    return !0;
                  }
                  b = "selector no match: " + a.name + f;
                  return !1;
                }
                if (a.parentSelector && (e = [e[0].parentNode.querySelector(a.parentSelector)], null == e[0])) {
                  if (!0 === a.optional) {
                    return !0;
                  }
                  b = "parent selector no match: " + a.name + f;
                  return !1;
                }
                if ("undefined" != typeof a.multiple && null != a.multiple && (!0 === a.multiple && 1 > e.length || !1 === a.multiple && 1 < e.length)) {
                  if (!h) {
                    return h = !0, l(a, d, f);
                  }
                  f = "selector multiple mismatch: " + a.name + f + " found: " + e.length;
                  if (!1 === a.optional) {
                    a = "";
                    for (var m in e) {
                      !e.hasOwnProperty(m) || 1000 < a.length || (a += " - " + m + ": " + e[m].outerHTML + " " + e[m].getAttribute("class") + " " + e[m].getAttribute("id"));
                    }
                    b = f + a + " el: " + d.getAttribute("class") + " " + d.getAttribute("id");
                    return !1;
                  }
                  A += " // " + f;
                  return !0;
                }
                if (a.isListSelector) {
                  return w[a.name] = e, !0;
                }
                if (!a.attribute) {
                  return b = "selector attribute undefined?: " + a.name + f, !1;
                }
                for (var r in e) {
                  if (e.hasOwnProperty(r)) {
                    d = e[r];
                    if (!d) {
                      break;
                    }
                    if (a.childNode) {
                      a.childNode = Number(a.childNode);
                      d = d.childNodes;
                      if (d.length < a.childNode) {
                        e = "childNodes fail: " + d.length + " - " + a.name + f;
                        if (!1 === a.optional) {
                          return b = e, !1;
                        }
                        A += " // " + e;
                        return !0;
                      }
                      d = d[a.childNode];
                    }
                    d = "text" == a.attribute ? d.textContent : "html" == a.attribute ? d.innerHTML : d.getAttribute(a.attribute);
                    if (!d || 0 == d.length || 0 == d.replace(/(\r\n|\n|\r)/gm, "").replace(/^\s+|\s+$/g, "").length) {
                      e = "selector attribute null: " + a.name + f;
                      if (!1 === a.optional) {
                        return b = e, !1;
                      }
                      A += " // " + e;
                      return !0;
                    }
                    if (a.regExp) {
                      m = d.match(new RegExp(a.regExp, "i"));
                      if (!m || m.length < a.reGroup) {
                        e = "regexp fail: " + d + " - " + a.name + f;
                        if (!1 === a.optional) {
                          return b = e, !1;
                        }
                        A += " // " + e;
                        return !0;
                      }
                      g.push(m[a.reGroup]);
                    } else {
                      g.push(d);
                    }
                    if (!a.multiple) {
                      break;
                    }
                  }
                }
                return a.multiple ? g : g[0];
              };
              z = document;
              var f = !1, g = {}, d;
              for (d in k.scrapeFilters) {
                g.$jscomp$loop$prop$pageType$69 = d;
                a: {
                  if (f) {
                    break;
                  }
                  g.$jscomp$loop$prop$pageFilter$66 = k.scrapeFilters[g.$jscomp$loop$prop$pageType$69];
                  var e = g.$jscomp$loop$prop$pageFilter$66.pageVersionTest, m = document.querySelectorAll(e.selector);
                  0 == m.length && (m = document.querySelectorAll(e.altSelector));
                  if (0 != m.length) {
                    if ("undefined" != typeof e.multiple && null != e.multiple) {
                      if (!0 === e.multiple && 2 > m.length) {
                        break a;
                      }
                      if (!1 === e.multiple && 1 < m.length) {
                        break a;
                      }
                    }
                    if (e.attribute) {
                      var r = null;
                      r = "text" == e.attribute ? "" : m[0].getAttribute(e.attribute);
                      if (null == r) {
                        break a;
                      }
                    }
                    x = g.$jscomp$loop$prop$pageType$69;
                    m = {};
                    for (var L in g.$jscomp$loop$prop$pageFilter$66) {
                      if (f) {
                        break;
                      }
                      m.$jscomp$loop$prop$sel$61 = g.$jscomp$loop$prop$pageFilter$66[L];
                      if (m.$jscomp$loop$prop$sel$61.name != e.name) {
                        if (m.$jscomp$loop$prop$sel$61.parentList) {
                          r = [];
                          if ("undefined" != typeof w[m.$jscomp$loop$prop$sel$61.parentList]) {
                            r = w[m.$jscomp$loop$prop$sel$61.parentList];
                          } else {
                            if (!0 === l(g.$jscomp$loop$prop$pageFilter$66[m.$jscomp$loop$prop$sel$61.parentList], z, g.$jscomp$loop$prop$pageType$69)) {
                              r = w[m.$jscomp$loop$prop$sel$61.parentList];
                            } else {
                              break;
                            }
                          }
                          a[m.$jscomp$loop$prop$sel$61.parentList] || (a[m.$jscomp$loop$prop$sel$61.parentList] = []);
                          var u = 0;
                          m.$jscomp$loop$prop$appendedHTMLOnce$63 = !1;
                          var q = {}, B;
                          for (B in r) {
                            if (f) {
                              break;
                            }
                            if (r.hasOwnProperty(B)) {
                              if ("stock" == m.$jscomp$loop$prop$sel$61.name) {
                                u++;
                                try {
                                  if (q.$jscomp$loop$prop$form$64 = void 0, q.$jscomp$loop$prop$offerId$59 = void 0, m.$jscomp$loop$prop$sel$61.selector && (q.$jscomp$loop$prop$form$64 = r[B].querySelector(m.$jscomp$loop$prop$sel$61.selector)), m.$jscomp$loop$prop$sel$61.altSelector && (q.$jscomp$loop$prop$offerId$59 = r[B].querySelector(m.$jscomp$loop$prop$sel$61.altSelector)), q.$jscomp$loop$prop$offerId$59 && (q.$jscomp$loop$prop$offerId$59 = q.$jscomp$loop$prop$offerId$59.getAttribute(m.$jscomp$loop$prop$sel$61.attribute)), 
                                  q.$jscomp$loop$prop$form$64) {
                                    q.$jscomp$loop$prop$iframe$57 = document.createElement("iframe");
                                    q.$jscomp$loop$prop$iframe$57.style.display = "none";
                                    q.$jscomp$loop$prop$iframe$57.name = m.$jscomp$loop$prop$sel$61.selector + "_" + q.$jscomp$loop$prop$offerId$59;
                                    document.body.appendChild(q.$jscomp$loop$prop$iframe$57);
                                    q.$jscomp$loop$prop$form$64.setAttribute("target", q.$jscomp$loop$prop$iframe$57.name);
                                    var R = q.$jscomp$loop$prop$form$64.querySelector('input[type="submit"]'), H = document.createElement("input");
                                    H.name = "submit.addToCart";
                                    H.value = R.getAttribute("value");
                                    var I = document.createElement("input");
                                    I.type = "hidden";
                                    var E = m.$jscomp$loop$prop$sel$61.regExp.split(";");
                                    I.name = E[0];
                                    I.value = E[1];
                                    q.$jscomp$loop$prop$qtySel$58 = JSON.parse(m.$jscomp$loop$prop$sel$61.childNode);
                                    q.$jscomp$loop$prop$form$64.appendChild(I);
                                    v++;
                                    q.$jscomp$loop$prop$mapIndex$62 = B + "";
                                    setTimeout(function(d, b) {
                                      return function() {
                                        var f = !1;
                                        d.$jscomp$loop$prop$iframe$57.onload = function() {
                                          if (!f) {
                                            d.$jscomp$loop$prop$iframe$57.onload = void 0;
                                            f = !0;
                                            var e = -1;
                                            try {
                                              for (var h = 0; h < d.$jscomp$loop$prop$qtySel$58.length; h++) {
                                                var g = d.$jscomp$loop$prop$qtySel$58[h][0];
                                                g = g.replace("[ID]", d.$jscomp$loop$prop$offerId$59);
                                                var l = d.$jscomp$loop$prop$qtySel$58[h][1], m = d.$jscomp$loop$prop$iframe$57.contentWindow.document.querySelector(g);
                                                if (m && (e = m.getAttribute(l))) {
                                                  break;
                                                }
                                              }
                                              if (!e) {
                                                throw "not found";
                                              }
                                              a[b.$jscomp$loop$prop$sel$61.parentList][d.$jscomp$loop$prop$mapIndex$62][b.$jscomp$loop$prop$sel$61.name] = e;
                                            } catch (T) {
                                              try {
                                                b.$jscomp$loop$prop$appendedHTMLOnce$63 || (b.$jscomp$loop$prop$appendedHTMLOnce$63 = !0, p.payload || (p.payload = [""]), null == p.payload[0] && (p.payload[0] = ""), p.payload[0] += " // toofast", k.dbg2 && p.payload.push(d.$jscomp$loop$prop$iframe$57.contentWindow.document.body.innerHTML));
                                              } catch (W) {
                                              }
                                            }
                                            0 == --v && n(p);
                                          }
                                        };
                                        d.$jscomp$loop$prop$form$64.submit();
                                      };
                                    }(q, m), u * m.$jscomp$loop$prop$sel$61.reGroup);
                                  }
                                } catch (V) {
                                }
                              } else {
                                if ("revealMAP" == m.$jscomp$loop$prop$sel$61.name) {
                                  q.$jscomp$loop$prop$revealMAP$67 = m.$jscomp$loop$prop$sel$61;
                                  var y = void 0;
                                  y = q.$jscomp$loop$prop$revealMAP$67.selector ? r[B].querySelector(q.$jscomp$loop$prop$revealMAP$67.selector) : r[B];
                                  if (null != y && y.textContent.match(new RegExp(q.$jscomp$loop$prop$revealMAP$67.regExp, "i"))) {
                                    y = document.location.href.match(/([BC][A-Z0-9]{9}|\d{9}(!?X|\d))/);
                                    y = y[1];
                                    var G = g.$jscomp$loop$prop$pageFilter$66.sellerId;
                                    "undefined" == typeof G || null == G || null == y || 2 > y.length || (G = r[B].querySelector('input[name="oid"]').value, null == G || 20 > G + 0 || (y = q.$jscomp$loop$prop$revealMAP$67.altSelector.replace("OFFERID", G).replace("ASINID", y), v++, q.$jscomp$loop$prop$mapIndex$7$68 = B + "", c(y, "GET", null, 3000, function(d, b) {
                                      return function(f) {
                                        if (4 == f.readyState) {
                                          v--;
                                          if (200 == f.status) {
                                            try {
                                              var e = f.responseText, h = d.$jscomp$loop$prop$pageFilter$66.price;
                                              if (h && h.regExp) {
                                                if (e.match(/no valid offer--/)) {
                                                  a[b.$jscomp$loop$prop$revealMAP$67.parentList][b.$jscomp$loop$prop$mapIndex$7$68] || (a[b.$jscomp$loop$prop$revealMAP$67.parentList][b.$jscomp$loop$prop$mapIndex$7$68] = {}), a[b.$jscomp$loop$prop$revealMAP$67.parentList][b.$jscomp$loop$prop$mapIndex$7$68][b.$jscomp$loop$prop$revealMAP$67.name] = -1;
                                                } else {
                                                  var g = e.match(new RegExp("price info--\x3e(?:.|\\n)*?" + h.regExp + "(?:.|\\n)*?\x3c!--")), l = e.match(/price info--\x3e(?:.|\n)*?(?:<span.*?size-small.*?">)([^]*?<\/span)(?:.|\n)*?\x3c!--/);
                                                  if (!g || g.length < h.reGroup) {
                                                    A += " //  priceMAP regexp fail: " + (e + " - " + h.name + d.$jscomp$loop$prop$pageType$69);
                                                  } else {
                                                    var m = g[h.reGroup];
                                                    a[b.$jscomp$loop$prop$revealMAP$67.parentList][b.$jscomp$loop$prop$mapIndex$7$68] || (a[b.$jscomp$loop$prop$revealMAP$67.parentList][b.$jscomp$loop$prop$mapIndex$7$68] = {});
                                                    a[b.$jscomp$loop$prop$revealMAP$67.parentList][b.$jscomp$loop$prop$mapIndex$7$68][b.$jscomp$loop$prop$revealMAP$67.name] = m;
                                                    null != l && 2 == l.length && (a[b.$jscomp$loop$prop$revealMAP$67.parentList][b.$jscomp$loop$prop$mapIndex$7$68][b.$jscomp$loop$prop$revealMAP$67.name + "Shipping"] = l[1].replace(/(\r\n|\n|\r)/gm, " ").replace(/^\s+|\s+$/g, "").replace(/\s{2,}/g, " "));
                                                  }
                                                }
                                              }
                                            } catch (T) {
                                            }
                                          }
                                          0 == v && n(p);
                                        }
                                      };
                                    }(g, q), function() {
                                      0 == --v && n(p);
                                    })));
                                  }
                                } else {
                                  y = l(m.$jscomp$loop$prop$sel$61, r[B], g.$jscomp$loop$prop$pageType$69);
                                  if (!1 === y) {
                                    f = !0;
                                    break;
                                  }
                                  if (!0 !== y) {
                                    if (a[m.$jscomp$loop$prop$sel$61.parentList][B] || (a[m.$jscomp$loop$prop$sel$61.parentList][B] = {}), m.$jscomp$loop$prop$sel$61.multiple) {
                                      for (var M in y) {
                                        y.hasOwnProperty(M) && !m.$jscomp$loop$prop$sel$61.keepBR && (y[M] = y[M].replace(/(\r\n|\n|\r)/gm, " ").replace(/^\s+|\s+$/g, "").replace(/\s{2,}/g, " "));
                                      }
                                      y = y.join("\u271c\u271c");
                                      a[m.$jscomp$loop$prop$sel$61.parentList][B][m.$jscomp$loop$prop$sel$61.name] = y;
                                    } else {
                                      a[m.$jscomp$loop$prop$sel$61.parentList][B][m.$jscomp$loop$prop$sel$61.name] = m.$jscomp$loop$prop$sel$61.keepBR ? y : y.replace(/(\r\n|\n|\r)/gm, " ").replace(/^\s+|\s+$/g, "").replace(/\s{2,}/g, " ");
                                    }
                                  }
                                }
                              }
                            }
                            q = {$jscomp$loop$prop$iframe$57:q.$jscomp$loop$prop$iframe$57, $jscomp$loop$prop$qtySel$58:q.$jscomp$loop$prop$qtySel$58, $jscomp$loop$prop$offerId$59:q.$jscomp$loop$prop$offerId$59, $jscomp$loop$prop$mapIndex$62:q.$jscomp$loop$prop$mapIndex$62, $jscomp$loop$prop$form$64:q.$jscomp$loop$prop$form$64, $jscomp$loop$prop$revealMAP$67:q.$jscomp$loop$prop$revealMAP$67, $jscomp$loop$prop$mapIndex$7$68:q.$jscomp$loop$prop$mapIndex$7$68};
                          }
                        } else {
                          r = l(m.$jscomp$loop$prop$sel$61, z, g.$jscomp$loop$prop$pageType$69);
                          if (!1 === r) {
                            f = !0;
                            break;
                          }
                          if (!0 !== r) {
                            if (m.$jscomp$loop$prop$sel$61.multiple) {
                              for (var K in r) {
                                r.hasOwnProperty(K) && !m.$jscomp$loop$prop$sel$61.keepBR && (r[K] = r[K].replace(/(\r\n|\n|\r)/gm, " ").replace(/^\s+|\s+$/g, "").replace(/\s{2,}/g, " "));
                              }
                              r = r.join();
                            } else {
                              m.$jscomp$loop$prop$sel$61.keepBR || (r = r.replace(/(\r\n|\n|\r)/gm, " ").replace(/^\s+|\s+$/g, "").replace(/\s{2,}/g, " "));
                            }
                            t[m.$jscomp$loop$prop$sel$61.name] = r;
                          }
                        }
                      }
                      m = {$jscomp$loop$prop$sel$61:m.$jscomp$loop$prop$sel$61, $jscomp$loop$prop$appendedHTMLOnce$63:m.$jscomp$loop$prop$appendedHTMLOnce$63};
                    }
                    f = !0;
                  }
                }
                g = {$jscomp$loop$prop$pageFilter$66:g.$jscomp$loop$prop$pageFilter$66, $jscomp$loop$prop$pageType$69:g.$jscomp$loop$prop$pageType$69};
              }
              if (null == x) {
                b += " // no pageVersion matched", p.status = 308, p.payload = [A, b, k.dbg1 ? document.getElementsByTagName("html")[0].innerHTML : ""];
              } else {
                if ("" === b) {
                  p.payload = [A];
                  p.scrapedData = t;
                  for (var P in a) {
                    p[P] = a[P];
                  }
                } else {
                  p.status = 305, p.payload = [A, b, k.dbg2 ? document.getElementsByTagName("html")[0].innerHTML : ""];
                }
              }
            } else {
              p.status = 306;
            }
            0 == v && n(p);
          }
        }
      }
    }
  }
  var k = !0;
  window.self === window.top && (k = !1);
  window.sandboxHasRun && (k = !1);
  k && (window.sandboxHasRun = !0, window.addEventListener("message", function(c) {
    if (c.source == window.parent && c.data) {
      var k = c.data.value;
      "data" == c.data.key && k.url && k.url == document.location && setTimeout(function() {
        null == document.body ? setTimeout(function() {
          n(k, function(c) {
            window.parent.postMessage({sandbox:c}, "*");
          });
        }, 1500) : n(k, function(c) {
          window.parent.postMessage({sandbox:c}, "*");
        });
      }, 800);
    }
  }, !1), window.parent.postMessage({sandbox:document.location + "", isUrlMsg:!0}, "*"));
  window.addEventListener("error", function(c, k, n, C, D) {
    "ipbakfmnjdenbmoenhicfmoojdojjjem" != chrome.runtime.id && "blfpbjkajgamcehdbehfdioapoiibdmc" != chrome.runtime.id || console.log(D);
    return !1;
  });
  return {scan:n};
}();
(function() {
  console.time("AmazonLoaded");
  var c = !1, n = !1, k = window.opera || -1 < navigator.userAgent.indexOf(" OPR/"), t = -1 < navigator.userAgent.toLowerCase().indexOf("firefox"), x = -1 < navigator.userAgent.toLowerCase().indexOf("edge/"), p = /Apple Computer/.test(navigator.vendor) && /Safari/.test(navigator.userAgent), C = t ? "Firefox" : p ? "Safari" : !k && !t && !x & !p ? "Chrome" : k ? "Opera" : x ? "Edge" : "Unknown", D = chrome.runtime.getManifest().version, z = !1;
  try {
    z = /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent);
  } catch (a) {
  }
  if (!window.keepaHasRun) {
    window.keepaHasRun = !0;
    var v = {amazonBridge:function() {
      var a = document.getElementsByTagName("head")[0], h = document.createElement("script");
      h.type = "text/javascript";
      h.src = "https://cdn.keepa.com/selectionHook2.js";
      a.appendChild(h);
      var l = 0;
      window.addEventListener("message", function(a) {
        if ("undefined" == typeof a.data.sandbox) {
          if ("https://keepa.com" == a.origin || "https://test.keepa.com" == a.origin) {
            if (a.data.hasOwnProperty("origin") && "keepaIframe" == a.data.origin) {
              b.handleIFrameMessage(a.data.key, a.data.value, function(d) {
                try {
                  a.source.postMessage({origin:"keepaContentScript", key:a.data.key, value:d, id:a.data.id}, a.origin);
                } catch (L) {
                }
              });
            } else {
              if ("string" === typeof a.data) {
                var h = a.data.split(",");
                if (2 > h.length) {
                  return;
                }
                if (2 < h.length) {
                  for (var d = 2, e = h.length; d < e; d++) {
                    h[1] += "," + h[d];
                  }
                }
                b.handleIFrameMessage(h[0], h[1], function(d) {
                  a.source.postMessage({origin:"keepaContentScript", value:d}, a.origin);
                });
              }
            }
          }
          if (a.origin.match(/^https?:\/\/.*?\.amazon\.(de|com|co\.uk|co\.jp|jp|ca|fr|es|it|in|com\.mx)/)) {
            v.staticBridge("log", "msg: " + a.data);
            try {
              var f = JSON.parse(a.data);
            } catch (r) {
              return;
            }
            (f = f.asin) && "null" != f && /([BC][A-Z0-9]{9}|\d{9}(!?X|\d))/.test(f) && (f != b.ASIN ? (b.ASIN = f, b.swapIFrame()) : 0 != l ? (window.clearTimeout(l), l = 1) : l = window.setTimeout(function() {
              b.swapIFrame();
            }, 1000));
          }
        }
      });
    }, storage:chrome.storage.local, iframeBridge:function() {
    }, get:function(a, b) {
      "function" != typeof b && (b = function() {
      });
      chrome.storage.local.get(a, b);
    }, set:function(a, b, l) {
      var h = {};
      h[a] = b;
      v.storage.set(h, l);
      "token" == a && 64 == b.length && chrome.storage.sync.set({KeepaHash:b}, function() {
      });
    }, remove:function(a, b) {
      v.storage.remove(a, b);
    }, staticBridge:function(a, b) {
      switch(a) {
        case "log":
          return null;
        case "showAlert":
          return chrome.runtime.sendMessage({type:"showAlert", val:b}), null;
        default:
          return null;
      }
    }}, b = {offset:1293836400000, offsetHours:359399, domain:0, yen:String.fromCharCode(165), iframeDocument:[], iframeWindow:[], iframeDOM:[], iframeJQ:[], iframeStorage:null, ASIN:null, tld:"", placeholder:"", storageIndex:-1, cssFlex:function() {
      var a = "flex", b = ["flex", "-webkit-flex", "-moz-box", "-webkit-box", "-ms-flexbox"], l = document.createElement("flexelement"), f;
      for (f in b) {
        try {
          if ("undefined" != l.style[b[f]]) {
            a = b[f];
            break;
          }
        } catch (g) {
        }
      }
      return a;
    }(), getDomain:function(a) {
      switch(a) {
        case "com":
          return 1;
        case "co.uk":
          return 2;
        case "de":
          return 3;
        case "fr":
          return 4;
        case "co.jp":
          return 5;
        case "jp":
          return 5;
        case "ca":
          return 6;
        case "it":
          return 8;
        case "es":
          return 9;
        case "in":
          return 10;
        case "com.mx":
          return 11;
        case "com.br":
          return 12;
        case "com.au":
          return 13;
        case "nl":
          return 14;
        default:
          return -1;
      }
    }, revealWorking:!1, juvecOnlyOnce:!1, revealMapOnlyOnce:!1, revealCache:{}, revealCacheStock:{}, revealMAP:function() {
      b.revealMapOnlyOnce || (b.revealMapOnlyOnce = !0, v.get("revealStock", function(a) {
        "undefined" == typeof a && (a = {});
        var h = 0;
        try {
          h = "0" != a.revealStock;
        } catch (J) {
        }
        try {
          if ((h || "com" == b.tld) && !b.revealWorking) {
            if (b.revealWorking = !0, document.getElementById("keepaMAP")) {
              b.revealWorking = !1;
            } else {
              var l = function() {
                var a = new MutationObserver(function(d) {
                  setTimeout(function() {
                    b.revealMAP();
                  }, 100);
                  try {
                    a.disconnect();
                  } catch (S) {
                  }
                });
                a.observe(document.getElementById("keepaMAP").parentNode.parentNode.parentNode, {childList:!0, subtree:!0});
              }, f = function(a, d, e, h) {
                e && (b.revealCacheStock[h] = e);
                var f = "aod-offer-heading" == a.id, g = (f ? a.parentElement : a).querySelector(".keepaMAP");
                if (null == (f ? a.parentElement : a).querySelector(".keepaStock")) {
                  null != g && null != g.parentElement && g.parentElement.remove();
                  b.revealWorking = !1;
                  g = document.createElement("div");
                  var c = !1, m = document.createElement("div");
                  m.id = "keepaMAP" + (f ? d + h : "");
                  m.style = "font-size: 12px;color: #767676;" + (f ? "display:block;" : "");
                  var r = document.createElement("div"), k = "juvecStock" == h;
                  f && !d ? (r.className = "a-column a-size-small a-span9 a-span-last", m.className = "a-column a-span3" + (k ? " keepaStock" : " keepaMAP")) : m.className = k ? " keepaStock" : " keepaMAP";
                  d ? (c = !0, m.textContent = "Hidden Price revealed by Keepa:", r.innerHTML = b.revealCache[h]) : b.revealCacheStock[h] && (c = b.revealCacheStock[h].stock, 999 == c && (c = "999+"), r.innerHTML = "<span style='font-weight: bold;'>" + c + "</span>" + (e.limit ? "&ensp;<span style='color:#da4c33'>max order limit</span>" : "") + (f ? "&emsp;<span style='color: #767676;'>(added by \u271c Keepa)</span>" : ""), m.innerHTML = "Stock" + (f ? "" : " (added by \u271c Keepa)"), c = !0);
                  null != e && null != e.price && -1 != a.textContent.toLowerCase().indexOf("add to cart to see product details.") && (h = document.createElement("div"), e = 5 == b.domain ? e.price : (Number(e.price) / 100).toFixed(2), k = new Intl.NumberFormat(" en-US en-GB de-DE fr-FR ja-JP en-CA zh-CN it-IT es-ES hi-IN es-MX pt-BR en-AU nl-NL tr-TR".split(" ")[b.domain], {style:"currency", currency:" USD GBP EUR EUR JPY CAD CNY EUR EUR INR MXN BRL AUD EUR TRY".split(" ")[b.domain]}), h.innerHTML = 
                  'Price: <span style="font-weight: bold;">' + k.format(e) + '</span>&ensp;<span style="color: #767676;">(by \u271c Keepa)</span>', g.appendChild(h));
                  c && (g.appendChild(m), g.appendChild(r), f ? d ? a.appendChild(g) : null != a.parentElement.querySelector(".aod-offer-divider") && (g.className = "a-row", g.style = "padding-top: 4px;", a.parentElement.querySelector(".aod-offer-divider").before(g)) : a.appendChild(g), f || l());
                }
              }, g = "1 ATVPDKIKX0DER A3P5ROKL5A1OLE A3JWKAKR8XB7XF A1X6FK5RDHNB96 AN1VRQENFRJN5 A3DWYIK6Y9EEQB A1AJ19PSB66TGU A11IL2PNWYJU7H A1AT7YVPFBWXBL A3P5ROKL5A1OLE AVDBXBAVVSXLQ A1ZZFT5FULY4LN ANEGB3WVEVKZB A17D2BRD4YMT0X".split(" "), d = document.location.href, e = function(a, d, e, h) {
                chrome.runtime.sendMessage({type:"getStock", asin:b.ASIN, oid:a, host:document.location.hostname, referer:document.location + "", domainId:b.domain, session:d}, function(d) {
                  f(e, !1, d, a);
                });
              }, m = /&seller=([A-Z0-9]{9,21})($|&)/;
              if (0 < d.indexOf("/offer-listing/")) {
                try {
                  var c = document.getElementById("olpTabContent");
                  if (null == c && (c = document.getElementById("olpOfferList"), null == c)) {
                    return;
                  }
                  var k = c.querySelector('[role="grid"]');
                  if (null != k) {
                    var u = k.childNodes, q;
                    for (q in u) {
                      if (u.hasOwnProperty(q)) {
                        var n = u[q];
                        if (null != n && "DIV" == n.nodeName) {
                          try {
                            var p = n.querySelector('input[name="offeringID.1"]');
                            if (p) {
                              var t = n.children[0], v = p.getAttribute("value"), E = n.querySelector('input[name="session-id"]');
                              if (E) {
                                var y = E.getAttribute("value"), x = n.querySelector('input[name="merchantID"]');
                                a = null;
                                null != x && (a = x.getAttribute("value"));
                                null == a && (a = null != n.querySelector('.olpSellerName img[alt="Amazon.' + b.tld + '"]') ? g[b.domain] : null);
                                if (null == a) {
                                  var w = n.querySelector(".olpSellerName a");
                                  null != w && (w = w.getAttribute("href"));
                                  if (null != w) {
                                    var z = w.match(m);
                                    null != z && 1 < z.length && (a = z[1]);
                                  }
                                }
                                -1 != n.textContent.toLowerCase().indexOf("add to cart to see product details.") ? e(v, y, t, !0) : h && e(v, y, t, !1);
                              }
                            }
                          } catch (J) {
                            console.log(J);
                          }
                        }
                      }
                    }
                  }
                } catch (J) {
                  b.reportBug(J, "MAP error: " + d);
                }
              } else {
                var A = new MutationObserver(function(a) {
                  try {
                    var h = document.querySelectorAll("#aod-offer,#aod-pinned-offer");
                    if (null != h && 0 != h.length) {
                      for (var f in h) {
                        if (h.hasOwnProperty(f)) {
                          var c = h[f];
                          if (null != c && "DIV" == c.nodeName) {
                            var l = c.querySelector('input[name="offeringID.1"]');
                            if (l) {
                              var r = l.getAttribute("value"), k = c.children[0], n = c.querySelector('input[name="session-id"]');
                              if (n) {
                                var q = n.getAttribute("value"), u = c.querySelector('input[name="merchantID"]');
                                a = null;
                                null != u && (a = u.getAttribute("value"));
                                null == a && (a = null != c.querySelector('.olpSellerName img[alt="Amazon.' + b.tld + '"]') ? g[b.domain] : null);
                                if (null == a) {
                                  var p = c.querySelector(".olpSellerName a, #aod-offer-soldBy a");
                                  null != p && (p = p.getAttribute("href"));
                                  null != p && p.match(m);
                                }
                                "undefined" === typeof b.revealCache[r] && -1 != c.textContent.toLowerCase().indexOf("add to cart to see product details.") ? (b.revealCache[r] = -2, e(r, q, k, !0)) : "undefined" === typeof b.revealCacheStock[r] && (b.revealCacheStock[r] = -2, e(r, q, k, !1));
                              }
                            }
                          }
                        }
                      }
                    }
                  } catch (U) {
                    b.reportBug(U, "MAP error: " + d);
                  }
                });
                A.observe(document.querySelector("body"), {childList:!0, attributes:!1, characterData:!1, subtree:!0, attributeOldValue:!1, characterDataOldValue:!1});
                window.onunload = function Q() {
                  try {
                    window.detachEvent("onunload", Q), A.disconnect();
                  } catch (S) {
                  }
                };
                var C = document.getElementById("price");
                if (null != C && /(our price|always remove it|add this item to your cart|see product details in cart|see price in cart)/i.test(C.textContent)) {
                  var D = document.getElementById("merchant-info"), F = "";
                  if (D) {
                    if (-1 == D.textContent.toLowerCase().indexOf("amazon.c")) {
                      var N = C.querySelector('span[data-action="a-modal"]');
                      if (N) {
                        var O = N.getAttribute("data-a-modal");
                        O.match(/offeringID\.1=(.*?)&amp/) && (F = RegExp.$1);
                      }
                      if (0 == F.length && !O.match(/map_help_pop_(.*?)"/)) {
                        b.revealWorking = !1;
                        return;
                      }
                    }
                    void 0 != b.revealCache[F] ? f(C, !1, b.revealCache[F], F) : chrome.runtime.sendMessage({type:"getStock", asin:b.ASIN, oid:F}, function(a) {
                      b.revealCache[F] = a;
                      f(C, !1, a, F);
                    });
                  } else {
                    b.revealWorking = !1;
                  }
                } else {
                  b.revealWorking = !1;
                }
              }
            }
          }
        } catch (J) {
          b.revealWorking = !1;
        }
      }));
    }, onPageLoad:function() {
      b.tld = RegExp.$2;
      var a = RegExp.$4;
      b.ASIN || (b.ASIN = a);
      b.domain = b.getDomain(b.tld);
      v.get("s_boxType", function(a) {
        "undefined" == typeof a && (a = {});
        document.addEventListener("DOMContentLoaded", function(h) {
          v.amazonBridge();
          if ("0" == a.s_boxType) {
            b.swapIFrame();
          } else {
            var f = document.getElementsByClassName("bucketDivider"), g = 0;
            if (void 0 === f[g]) {
              if (void 0 === f[0]) {
                return;
              }
              g = 0;
            }
            h = document.createElement("div");
            h.setAttribute("id", "keepaButton");
            h.setAttribute("style", "background-color: #444; border: 0 solid #ccc; border-radius: 6px 6px 6px 6px; color: #fff;cursor: pointer; font-size: 12px; margin: 15px;\tpadding: 6px; text-decoration: none; text-shadow: none;\tfloat:left;\tbox-shadow: 0px 0px 7px 0px #888;");
            var d = document.createElement("style");
            d.appendChild(document.createTextNode("#keepaButton:hover{background-color:#666 !important}"));
            document.head.appendChild(d);
            h.addEventListener("click", function() {
              var a = document.getElementById("keepaButton");
              a.parentNode.removeChild(a);
              b.swapIFrame();
            }, !1);
            h.textContent = "Show KeepaBox";
            f = document.getElementsByClassName("lpo")[0] && f[1] && 0 == g ? f[1] : f[g];
            f = "promotions_feature_div" == f.parentNode.id ? f.parentNode : f;
            f.parentNode.insertBefore(h, f);
          }
        }, !1);
      });
    }, swapIFrame:function() {
      v.staticBridge("log", "swap in ASIN: " + b.ASIN);
      try {
        b.revealMAP(document, b.ASIN, b.tld);
      } catch (h) {
      }
      if (!onlyStock && "com.br" != b.tld && "com.au" != b.tld && "nl" != b.tld && !document.getElementById("keepaButton")) {
        b.swapIFrame.swapTimer && clearTimeout(b.swapIFrame.swapTimer);
        b.swapIFrame.swapTimer = setTimeout(function() {
          z || (document.getElementById("keepaContainer") || b.getPlaceholderAndInsertIFrame(), b.swapIFrame.swapTimer = setTimeout(function() {
            document.getElementById("keepaContainer") || b.getPlaceholderAndInsertIFrame();
          }, 2000));
        }, 2000);
        var a = document.getElementById("keepaContainer");
        if (null != b.iframeStorage && a) {
          v.staticBridge("log", "swap in ASIN - found old iframe: " + b.ASIN + " element: " + a);
          try {
            b.iframeStorage.src = b.getIframeUrl(b.domain, b.ASIN);
          } catch (h) {
            console.error(h);
          }
        } else {
          b.getPlaceholderAndInsertIFrame();
        }
      }
    }, getDevicePixelRatio:function() {
      var a = 1;
      void 0 !== window.screen.systemXDPI && void 0 !== window.screen.logicalXDPI && window.screen.systemXDPI > window.screen.logicalXDPI ? a = window.screen.systemXDPI / window.screen.logicalXDPI : void 0 !== window.devicePixelRatio && (a = window.devicePixelRatio);
      return a;
    }, getPlaceholderAndInsertIFrame:function() {
      v.get(["keepaBoxPlaceholder", "keepaBoxPlaceholderBackup", "keepaBoxPlaceholderBackupClass"], function(a) {
        "undefined" == typeof a && (a = {});
        var h = 0, c = function() {
          if (!document.getElementById("keepaButton") && !document.getElementById("amazonlive-homepage-widget")) {
            if (z) {
              var f = document.getElementById("tellAFriendBox_feature_div");
              if (f && f.previousSibling) {
                v.get(["s_overlay"], function(a) {
                  "undefined" == typeof a && (a = {});
                  try {
                    var d = a.s_overlay;
                    try {
                      d = JSON.parse(d);
                    } catch (H) {
                    }
                    var h = Math.min(1000, 1.5 * window.innerWidth).toFixed(0), e = (h / (window.innerWidth / 200)).toFixed(0), g = "https://graph.keepa.com/pricehistory.png?type=2&asin=" + b.ASIN + "&domain=" + b.domain + "&width=" + h + "&height=" + e;
                    g = "undefined" == typeof d ? g + "&amazon=1&new=1&used=1&salesrank=1&range=365" : g + ("&amazon=" + d[0] + "&new=" + d[1] + "&used=" + d[2] + "&salesrank=" + d[3] + "&range=" + d[4]);
                    var c = document.createElement("img");
                    c.setAttribute("style", "margin-top: 15px; width: " + window.innerWidth + "px; height: 200px;");
                    c.setAttribute("id", "keepaImageContainer" + b.ASIN);
                    c.setAttribute("src", g);
                    f.previousSibling.after(c);
                    c.addEventListener("click", function() {
                      c.remove();
                      b.insertIFrame(f.previousSibling, !1, !0);
                    }, !1);
                  } catch (H) {
                  }
                });
                return;
              }
            }
            var g = document.getElementById("gpdp-btf-container");
            if (g && g.previousElementSibling) {
              b.insertIFrame(g.previousElementSibling, !1, !0);
            } else {
              if ((g = document.getElementsByClassName("mocaGlamorContainer")[0]) || (g = document.getElementById("dv-sims")), g || (g = document.getElementById("mas-terms-of-use")), g && g.nextSibling) {
                b.insertIFrame(g.nextSibling, !1, !0);
              } else {
                var d = a.keepaBoxPlaceholder || "bottomRow";
                g = !1;
                if (d = document.getElementById(d)) {
                  "sims_fbt" == d.previousElementSibling.id && (d = d.previousElementSibling, "bucketDivider" == d.previousElementSibling.className && (d = d.previousElementSibling), g = !0), b.insertIFrame(d, g);
                } else {
                  if (d = a.keepaBoxPlaceholderBackup || "elevatorBottom", d = document.getElementById(d)) {
                    b.insertIFrame(d, !0);
                  } else {
                    if (d = document.getElementById("hover-zoom-end")) {
                      b.insertIFrame(d, !0);
                    } else {
                      if (d = a.keepaBoxPlaceholderBackupClass || "a-fixed-left-grid", (d = document.getElementsByClassName(d)[0]) && d.nextSibling) {
                        b.insertIFrame(d.nextSibling, !0);
                      } else {
                        g = 0;
                        d = document.getElementsByClassName("twisterMediaMatrix");
                        var e = !!document.getElementById("dm_mp3Player");
                        if ((d = 0 == d.length ? document.getElementById("handleBuy") : d[0]) && 0 == g && !e && null != d.nextElementSibling) {
                          var m = !1;
                          for (e = d; e;) {
                            if (e = e.parentNode, "table" === e.tagName.toLowerCase()) {
                              if ("buyboxrentTable" === e.className || /buyBox/.test(e.className) || "buyingDetailsGrid" === e.className) {
                                m = !0;
                              }
                              break;
                            } else {
                              if ("html" === e.tagName.toLowerCase()) {
                                break;
                              }
                            }
                          }
                          if (!m) {
                            d = d.nextElementSibling;
                            b.insertIFrame(d, !1);
                            return;
                          }
                        }
                        d = document.getElementsByClassName("bucketDivider");
                        0 == d.length && (d = document.getElementsByClassName("a-divider-normal"));
                        if (!d[g]) {
                          if (!d[0]) {
                            40 > h++ && window.setTimeout(function() {
                              c();
                            }, 100);
                            return;
                          }
                          g = 0;
                        }
                        for (e = d[g]; e && d[g];) {
                          if (e = e.parentNode, "table" === e.tagName.toLowerCase()) {
                            if ("buyboxrentTable" === e.className || /buyBox/.test(e.className) || "buyingDetailsGrid" === e.className) {
                              e = d[++g];
                            } else {
                              break;
                            }
                          } else {
                            if ("html" === e.tagName.toLowerCase()) {
                              break;
                            }
                          }
                        }
                        b.placeholder = d[g];
                        d[g] && d[g].parentNode && (v.staticBridge("log", "getPlaceholderAndInsertIFrame Insert"), g = document.getElementsByClassName("lpo")[0] && d[1] && 0 == g ? d[1] : d[g], b.insertIFrame(g, !1));
                      }
                    }
                  }
                }
              }
            }
          }
        };
        c();
      });
    }, getAFComment:function(a) {
      for (a = [a]; 0 < a.length;) {
        for (var b = a.pop(), c = 0; c < b.childNodes.length; c++) {
          var f = b.childNodes[c];
          if (8 === f.nodeType && -1 < f.textContent.indexOf("MarkAF")) {
            return f;
          }
          a.push(f);
        }
      }
      return null;
    }, getIframeUrl:function(a, b) {
      return "https://keepa.com/iframe_addon.html#" + a + "-0-" + b;
    }, insertIFrame:function(a, h) {
      if (null != b.iframeStorage && document.getElementById("keepaContainer")) {
        b.swapIFrame();
      } else {
        var c = document.getElementById("hover-zoom-end"), f = function(a) {
          for (var d = document.getElementById(a), b = []; d;) {
            b.push(d), d.id = "a-different-id", d = document.getElementById(a);
          }
          for (d = 0; d < b.length; ++d) {
            b[d].id = a;
          }
          return b;
        }("hover-zoom-end");
        v.get("s_boxHorizontal", function(g) {
          "undefined" == typeof g && (g = {});
          if (null == a) {
            setTimeout(b.getPlaceholderAndInsertIFrame, 2000);
          } else {
            var d = g.s_boxHorizontal, e = window.innerWidth - 50;
            if (document.getElementById("keepaContainer")) {
              v.staticBridge("log", "could not find keepa container");
            } else {
              g = 0 < document.location.href.indexOf("/offer-listing/");
              var m = b.getIframeUrl(b.domain, b.ASIN), l = document.createElement("div");
              "0" != d || g ? l.setAttribute("style", "min-width: 935px; width: calc(100% - 30px); height: 320px; display: flex; border:0 none; margin: 10px 0 0;") : (e -= 550, 960 > e && (e = 960), l.setAttribute("style", "min-width: 935px; max-width:" + e + "px;display: flex;  height: 320px; border:0 none; margin: 10px 0 0;"));
              l.setAttribute("id", "keepaContainer");
              var k = document.createElement("iframe");
              d = document.createElement("div");
              d.setAttribute("id", "keepaClear");
              k.setAttribute("style", "width: 100%; height: 100%; border:0 none;overflow: hidden;");
              k.setAttribute("src", m);
              k.setAttribute("scrolling", "no");
              k.setAttribute("id", "keepa");
              n || (n = !0, console.timeEnd("AmazonLoaded"), console.time("KeepaBoxLoaded"), chrome.runtime.sendMessage({type:"optionalPermissionsRequired"}, function(a) {
                console.log("opr: ", a.value);
                if (!0 === a.value) {
                  var d = function() {
                    chrome.runtime.sendMessage({type:"optionalPermissions"}, function(a) {
                      console.log(a);
                    });
                    document.body.removeEventListener("click", d);
                  };
                  document.body.addEventListener("click", d);
                }
              }));
              l.appendChild(k);
              e = !1;
              if (!h) {
                null == a.parentNode || "promotions_feature_div" !== a.parentNode.id && "dp-out-of-stock-top_feature_div" !== a.parentNode.id || (a = a.parentNode);
                try {
                  var u = a.previousSibling.previousSibling;
                  null != u && "technicalSpecifications_feature_div" == u.id && (a = u);
                } catch (y) {
                }
                0 < f.length && (c = f[f.length - 1]) && "centerCol" != c.parentElement.id && ((u = b.getFirstInDOM([a, c], document.body)) && 600 < u.parentElement.offsetWidth && (a = u), a === c && (e = !0));
                (u = document.getElementById("title") || document.getElementById("title_row")) && b.getFirstInDOM([a, u], document.body) !== u && (a = u);
              }
              u = document.getElementById("vellumMsg");
              null != u && (a = u);
              u = document.body;
              var q = document.documentElement;
              q = Math.max(u.scrollHeight, u.offsetHeight, q.clientHeight, q.scrollHeight, q.offsetHeight);
              var p = a.offsetTop / q;
              if (0.5 < p || 0 > p) {
                u = b.getAFComment(u), null != u && (p = a.offsetTop / q, 0.5 > p && (a = u));
              }
              if (a.parentNode) {
                u = document.querySelector(".container_vertical_middle");
                g ? (a = document.getElementById("olpTabContent"), a || (a = document.getElementById("olpProduct"), a = a.nextSibling), a.parentNode.insertBefore(l, a)) : "burjPageDivider" == a.id ? (a.parentNode.insertBefore(l, a), h || a.parentNode.insertBefore(d, l.nextSibling)) : "bottomRow" == a.id ? (a.parentNode.insertBefore(l, a), h || a.parentNode.insertBefore(d, l.nextSibling)) : e ? (a.parentNode.insertBefore(l, a.nextSibling), h || a.parentNode.insertBefore(d, l.nextSibling)) : null != 
                u ? (a = u, a.parentNode.insertBefore(l, a.nextSibling), h || a.parentNode.insertBefore(d, l.nextSibling)) : (a.parentNode.insertBefore(l, a), h || a.parentNode.insertBefore(d, l));
                b.iframeStorage = k;
                l.style.display = b.cssFlex;
                var t = !1, w = 5;
                if (!z) {
                  var x = setInterval(function() {
                    if (0 >= w--) {
                      clearInterval(x);
                    } else {
                      var a = null != document.getElementById("keepa" + b.ASIN);
                      try {
                        if (!a) {
                          throw b.getPlaceholderAndInsertIFrame(), 1;
                        }
                        if (t) {
                          throw 1;
                        }
                        document.getElementById("keepa" + b.ASIN).contentDocument.location = m;
                      } catch (G) {
                        clearInterval(x);
                      }
                    }
                  }, 4000), E = function() {
                    t = !0;
                    k.removeEventListener("load", E, !1);
                    b.synchronizeIFrame();
                  };
                  k.addEventListener("load", E, !1);
                }
              } else {
                b.swapIFrame(), v.staticBridge("log", "placeholder.parentNode null...");
              }
            }
          }
        });
      }
    }, handleIFrameMessage:function(a, b, l) {
      switch(a) {
        case "resize":
          c || (c = !0, console.timeEnd("KeepaBoxLoaded"));
          b = "" + b;
          -1 == b.indexOf("px") && (b += "px");
          if (a = document.getElementById("keepaContainer")) {
            a.style.height = b;
          }
          break;
        case "alert":
          b = encodeURIComponent("Kindle Fire HD Tablet");
          a = encodeURIComponent("51e5r0yV5AL.jpg");
          v.staticBridge("showAlert", "https://keepa.com/app/notification.html#B0083PWAPW/1/0/0/16900/19000/" + a + "/" + b);
          break;
        case "ping":
          l({location:chrome.runtime.id + " " + document.location});
          break;
        case "storageGetAll":
          chrome.runtime.sendMessage({type:"getFreshStorage"}, function(a) {
            l({storage:a.value});
          });
          break;
        case "storageSet":
          chrome.runtime.sendMessage({type:"setStorage", key:b.key, val:b.val});
      }
    }, synchronizeIFrame:function() {
      v.iframeBridge();
      var a = 0;
      v.get("s_boxHorizontal", function(b) {
        "undefined" != typeof b && "undefined" != typeof b.s_boxHorizontal && (a = b.s_boxHorizontal);
      });
      var b = window.innerWidth, c = !1;
      z || window.addEventListener("resize", function() {
        c || (c = !0, window.setTimeout(function() {
          if (b != window.innerWidth && "0" == a) {
            b = window.innerWidth;
            var h = window.innerWidth - 50;
            h -= 550;
            935 > h && (h = 935);
            document.getElementById("keepaContainer").style.width = h;
          }
          c = !1;
        }, 100));
      }, !1);
    }, getFirstInDOM:function(a, h) {
      var c;
      for (h = h.firstChild; h; h = h.nextSibling) {
        if ("IFRAME" !== h.nodeName && 1 === h.nodeType) {
          if (-1 !== a.indexOf(h)) {
            return h;
          }
          if (c = b.getFirstInDOM(a, h)) {
            return c;
          }
        }
      }
      return null;
    }, getClipRect:function(a) {
      "string" === typeof a && (a = document.querySelector(a));
      var c = 0, l = 0, f = function(a) {
        c += a.offsetLeft;
        l += a.offsetTop;
        a.offsetParent && f(a.offsetParent);
      };
      f(a);
      return 0 == l && 0 == c ? b.getClipRect(a.parentNode) : {top:l, left:c, width:a.offsetWidth, height:a.offsetHeight};
    }, findPlaceholderBelowImages:function(a) {
      var c = a, l, f = 100;
      do {
        for (f--, l = null; !l;) {
          l = a.nextElementSibling, l || (l = a.parentNode.nextElementSibling), a = l ? l : a.parentNode.parentNode, !l || "IFRAME" !== l.nodeName && "SCRIPT" !== l.nodeName && 1 === l.nodeType || (l = null);
        }
      } while (0 < f && 100 < b.getClipRect(l).left);
      return l ? l : c;
    }, httpGet:function(a, b) {
      var c = new XMLHttpRequest;
      b && (c.onreadystatechange = function() {
        4 == c.readyState && b.call(this, c.responseText);
      });
      c.open("GET", a, !0);
      c.send();
    }, httpPost2:function(a, b, c, f, g) {
      var d = new XMLHttpRequest;
      f && (d.onreadystatechange = function() {
        4 == d.readyState && f.call(this, d.responseText);
      });
      d.withCredentials = g;
      d.open("POST", a, !0);
      d.setRequestHeader("Content-Type", c);
      d.send(b);
    }, httpPost:function(a, c, l, f) {
      b.httpPost2(a, c, "text/plain;charset=UTF-8", l, f);
    }, lastBugReport:0, reportBug:function(a, c, l) {
      var f = Date.now();
      if (!(6E5 > f - b.lastBugReport || /(dead object)|(Script error)|(\.location is null)/i.test(a))) {
        b.lastBugReport = f;
        f = "";
        try {
          f = Error().stack.split("\n").splice(1).splice(1).join("&ensp;&lArr;&ensp;");
          if (!/(keepa|content)\.js/.test(f)) {
            return;
          }
          f = f.replace(/chrome-extension:\/\/.*?\/content\//g, "").replace(/:[0-9]*?\)/g, ")").replace(/[ ]{2,}/g, "");
        } catch (g) {
        }
        if ("object" == typeof a) {
          try {
            a = JSON.stringify(a);
          } catch (g) {
          }
        }
        null == l && (l = {exception:a, additional:c, url:document.location.toString(), stack:f});
        l.keepaType = keepaType;
        l.version = D;
        v.get("token", function(a) {
          "undefined" == typeof a && (a = {token:"undefined"});
          b.httpPost("https://dyn.keepa.com/service/bugreport/?user=" + a.token + "&type=" + C, JSON.stringify(l));
        });
      }
    }};
    window.onerror = function(a, c, l, f, g) {
      "object" === typeof a && a.srcElement && a.target && (a = "[object HTMLScriptElement]" == a.srcElement && "[object HTMLScriptElement]" == a.target ? "Error loading script" : "Event Error - target:" + a.target + " srcElement:" + a.srcElement);
      a = a.toString();
      var d = "";
      f = f || 0;
      if (g && g.stack) {
        d = g.stack;
        try {
          d = g.stack.split("\n").splice(1).splice(1).join("&ensp;&lArr;&ensp;");
          if (!/(keepa|content)\.js/.test(d)) {
            return;
          }
          d = d.replace(/chrome-extension:\/\/.*?\/content\//g, "").replace(/:[0-9]*?\)/g, ")").replace(/[ ]{2,}/g, "");
        } catch (e) {
        }
      }
      a = {msg:a, url:(c || document.location.toString()) + ":" + parseInt(l || 0) + ":" + parseInt(f || 0), stack:d};
      "ipbakfmnjdenbmoenhicfmoojdojjjem" != chrome.runtime.id && "blfpbjkajgamcehdbehfdioapoiibdmc" != chrome.runtime.id || console.log(a);
      b.reportBug(null, null, a);
      return !1;
    };
    if (window.self == window.top && !/.*music\.amazon\..*/.test(document.location.href) && !/.*primenow\.amazon\..*/.test(document.location.href) && !/.*amazon\.com\/restaurants.*/.test(document.location.href)) {
      var A = function(a) {
        chrome.runtime.sendMessage({type:"sendData", val:{key:"m1", payload:[a]}}, function() {
        });
      };
      chrome.runtime.sendMessage({type:"getStorage"}, function(a) {
        var c = document.location.href, l = !1;
        document.addEventListener("DOMContentLoaded", function(a) {
          if (!l) {
            try {
              if (c.startsWith("https://test.keepa.com") || c.startsWith("https://keepa.com")) {
                var b = document.createElement("div");
                b.id = "extension";
                b.setAttribute("type", C);
                b.setAttribute("version", D);
                document.body.appendChild(b);
                l = !0;
              }
            } catch (e) {
            }
          }
        });
        var f = !1;
        c.match(/^htt(p|ps):\/\/.*?\.amazon\.(de|com|co\.uk|co\.jp|ca|fr|it|es|nl|in|com\.mx|com\.br|com\.au)\/s\?/) ? (onlyStock = !0, b.onPageLoad()) : /((\/images)|(\/review)|(\/customer-reviews)|(ask\/questions)|(\/product-reviews))/.test(c) || /\/e\/([BC][A-Z0-9]{9}|\d{9}(!?X|\d))/.test(c) || !c.match(/^htt(p|ps):\/\/.*?\.amazon\.(de|com|co\.uk|co\.jp|ca|fr|it|es|nl|in|com\.mx|com\.br|com\.au)\/[^.]*?(\/|[?&]ASIN=)([BC][A-Z0-9]{9}|\d{9}(!?X|\d))/) && !c.match(/^htt(p|ps):\/\/.*?\.amzn\.(com).*?\/([BC][A-Z0-9]{9}|\d{9}(!?X|\d))/) ? 
        c.match(/^htt(p|ps):\/\/.*?\.amazon\.(de|com|co\.uk|co\.jp|ca|fr|it|es|in|com\.mx|com\.br|com\.au)\/[^.]*?\/(wishlist|registry)/) || c.match(/^htt(p|ps):\/\/w*?\.amzn\.(com)[^.]*?\/(wishlist|registry)/) || (c.match(/^https?:\/\/.*?(?:seller).*?\.amazon\.(de|com|co\.uk|co\.jp|ca|fr|it|nl|es|in|com\.mx|com\.br|com\.au)\//) ? A("s" + b.getDomain(RegExp.$1)) : c.match(/^https?:\/\/.*?(?:af.?ilia|part|assoc).*?\.amazon\.(de|com|co\.uk|co\.jp|nl|ca|fr|it|es|in|com\.mx|com\.br|com\.au)\/home/) && 
        A("a" + b.getDomain(RegExp.$1))) : (b.onPageLoad(!1), f = !0);
        z || (a = /^https?:\/\/.*?\.amazon\.(de|com|co\.uk|co\.jp|ca|fr|it|es|in|com\.mx|com\.br|com\.au)\/(s([\/?])|gp\/bestsellers\/|gp\/search\/|.*?\/b\/)/, (f || c.match(a)) && document.addEventListener("DOMContentLoaded", function(a) {
          var d = null;
          chrome.runtime.sendMessage({type:"getFilters"}, function(a) {
            d = a;
            if (null != d && null != d.value) {
              var e = function() {
                var d = c.match(/^https?:\/\/.*?\.amazon\.(de|com|co\.uk|co\.jp|ca|fr|it|es|in|com\.mx)\//);
                if (f || d) {
                  var e = b.getDomain(RegExp.$1);
                  scanner.scan(a.value, function(a) {
                    a.key = "f1";
                    a.domainId = e;
                    chrome.runtime.sendMessage({type:"sendData", val:a}, function(a) {
                    });
                  });
                }
              };
              e();
              var g = document.location.href, h = -1, l = -1, k = -1;
              l = setInterval(function() {
                g != document.location.href && (g = document.location.href, clearTimeout(k), k = setTimeout(function() {
                  e();
                }, 2000), clearTimeout(h), h = setTimeout(function() {
                  clearInterval(l);
                }, 180000));
              }, 2000);
              h = setTimeout(function() {
                clearInterval(l);
              }, 180000);
            }
          });
        }), document.location.href.match(/^https?:\/\/.*?\.amazon\.(de|com|co\.uk|co\.jp|ca|fr|it|es|in|com\.mx|com\.br|com\.au)\//) && document.addEventListener("DOMContentLoaded", function(a) {
          setTimeout(function() {
            chrome.runtime.onMessage.addListener(function(a, c, f) {
              switch(a.key) {
                case "collectASINs":
                  a = {};
                  var d = !1;
                  c = (document.querySelector("#main") || document.querySelector("#zg") || document.querySelector("#pageContent") || document.querySelector("#wishlist-page") || document.querySelector("#merchandised-content") || document.querySelector("[id^='contentGrid']") || document.querySelector("#container") || document.querySelector(".a-container") || document).getElementsByTagName("a");
                  if (void 0 != c && null != c) {
                    for (var e = 0; e < c.length; e++) {
                      var h = c[e].href;
                      /\/images/.test(h) || /\/e\/([BC][A-Z0-9]{9}|\d{9}(!?X|\d))/.test(h) || !h.match(/^https?:\/\/.*?\.amazon\.(de|com|co\.uk|co\.jp|ca|fr|it|es|in|com\.mx|com\.br|com\.au)\/[^.]*?(?:\/|\?ASIN=)([BC][A-Z0-9]{9}|\d{9}(!?X|\d))/) && !h.match(/^https?:\/\/.*?\.amzn\.(com)[^.]*?\/([BC][A-Z0-9]{9}|\d{9}(!?X|\d))/) || (d = RegExp.$2, h = b.getDomain(RegExp.$1), "undefined" === typeof a[h] && (a[h] = []), a[h].includes(d) || a[h].push(d), d = !0);
                    }
                  }
                  if (d) {
                    f(a);
                  } else {
                    return alert("Keepa: No product ASINs found on this page."), !1;
                  }
                  break;
                default:
                  f({});
              }
            });
            v.get(["overlayPriceGraph", "s_overlay"], function(a) {
              "undefined" == typeof a && (a = {});
              try {
                var b = a.overlayPriceGraph, d = a.s_overlay;
                try {
                  d = JSON.parse(d);
                } catch (H) {
                }
                var c;
                if (1 == b) {
                  var f = document.getElementsByTagName("a"), h = 0 < document.location.href.indexOf("/offer-listing/");
                  if (void 0 != f && null != f) {
                    for (c = 0; c < f.length; c++) {
                      var g = f[c].href;
                      /\/images/.test(g) || /\/e\/([BC][A-Z0-9]{9}|\d{9}(!?X|\d))/.test(g) || !g.match(/^https?:\/\/.*?\.amazon\.(de|com|co\.uk|co\.jp|ca|fr|it|es|in|com\.mx)\/[^.]*?(?:\/|\?ASIN=)([BC][A-Z0-9]{9}|\d{9}(!?X|\d))/) && !g.match(/^https?:\/\/.*?\.amzn\.(com)[^.]*?\/([BC][A-Z0-9]{9}|\d{9}(!?X|\d))/) || (h || -1 == g.indexOf("offer-listing")) && w.add_events(d, f[c], g, RegExp.$1, RegExp.$2);
                    }
                  }
                  var l = function(a) {
                    if ("A" == a.nodeName) {
                      var b = a.href;
                      /\/images/.test(b) || /\/e\/([BC][A-Z0-9]{9}|\d{9}(!?X|\d))/.test(b) || !b.match(/^https?:\/\/.*?\.amazon\.(de|com|co\.uk|co\.jp|ca|fr|it|es|in|com\.mx)\/[^.]*?(?:\/|\?ASIN=)([BC][A-Z0-9]{9}|\d{9}(!?X|\d))/) && !b.match(/^https?:\/\/.*?\.amzn\.(com)[^.]*?\/([BC][A-Z0-9]{9}|\d{9}(!?X|\d))/) || (h || -1 == b.indexOf("offer-listing")) && w.add_events(d, a, b, RegExp.$1, RegExp.$2);
                    }
                  }, k = new MutationObserver(function(a) {
                    a.forEach(function(a) {
                      try {
                        if ("childList" === a.type) {
                          for (c = 0; c < a.addedNodes.length; c++) {
                            l(a.addedNodes[c]);
                            for (var b = a.addedNodes[c].children; null != b && "undefined" != b && 0 < b.length;) {
                              for (var d = [], e = 0; e < b.length; e++) {
                                l(b[e]);
                                try {
                                  if (b[e].children && 0 < b[e].children.length) {
                                    for (var f = 0; f < b[e].children.length && 30 > f; f++) {
                                      d.push(b[e].children[f]);
                                    }
                                  }
                                } catch (K) {
                                }
                              }
                              b = d;
                            }
                          }
                        } else {
                          if (d = a.target.getElementsByTagName("a"), "undefined" != d && null != d) {
                            for (b = 0; b < d.length; b++) {
                              l(d[b]);
                            }
                          }
                        }
                        l(a.target);
                      } catch (K) {
                      }
                    });
                  });
                  k.observe(document.querySelector("html"), {childList:!0, attributes:!1, characterData:!1, subtree:!0, attributeOldValue:!1, characterDataOldValue:!1});
                  window.onunload = function I() {
                    try {
                      window.detachEvent("onunload", I), k.disconnect();
                    } catch (E) {
                    }
                  };
                }
              } catch (H) {
              }
            });
          }, 100);
        }));
      });
      var w = {image_urls_main:[], pf_preview_current:"", preview_images:[], tld:"", img_string:'<img style="border: 1px solid #ff9f29;  -moz-border-radius: 0px;  margin: -3px;   display:block;   position: relative;   top: -3px;   left: -3px;" src=\'', createNewImageElement:function(a) {
        a = a.createElement("img");
        a.style.borderTop = "2px solid #ff9f29";
        a.style.borderBottom = "3px solid grey";
        a.style.display = "block";
        a.style.position = "relative";
        a.style.padding = "5px";
        return a;
      }, preview_image:function(a, b, c, f, g) {
        try {
          var d = b.originalTarget.ownerDocument;
        } catch (L) {
          d = document;
        }
        if (!d.getElementById("pf_preview")) {
          var e = d.createElement("div");
          e.id = "pf_preview";
          e.addEventListener("mouseout", function(a) {
            w.clear_image(a);
          }, !1);
          e.style.boxShadow = "rgb(68, 68, 68) 0px 1px 7px -2px";
          e.style.position = "fixed";
          e.style.zIndex = "10000000";
          e.style.bottom = "0px";
          e.style.right = "0px";
          e.style.margin = "12px 12px";
          e.style.backgroundColor = "#fff";
          d.body.appendChild(e);
        }
        w.pf_preview_current = d.getElementById("pf_preview");
        if (!w.pf_preview_current.firstChild) {
          e = Math.max(Math.floor(0.3 * d.defaultView.innerHeight), 128);
          var h = Math.max(Math.floor(0.3 * d.defaultView.innerWidth), 128), l = 2;
          if (300 > h || 150 > e) {
            l = 1;
          }
          1000 < h && (h = 1000);
          1000 < e && (e = 1000);
          w.pf_preview_current.current = -1;
          w.pf_preview_current.a = f;
          w.pf_preview_current.href = c;
          w.pf_preview_current.size = Math.floor(1.1 * Math.min(h, e));
          d.defaultView.innerWidth - b.clientX < 1.05 * h && d.defaultView.innerHeight - b.clientY < 1.05 * e && (b = d.getElementById("pf_preview"), b.style.right = "", b.style.left = "6px");
          f = "https://graph.keepa.com/pricehistory.png?type=" + l + "&asin=" + f + "&domain=" + g + "&width=" + h + "&height=" + e;
          f = "undefined" == typeof a ? f + "&amazon=1&new=1&used=1&salesrank=1&range=365" : f + ("&amazon=" + a[0] + "&new=" + a[1] + "&used=" + a[2] + "&salesrank=" + a[3] + "&range=" + a[4]);
          d.getElementById("pf_preview").style.display = "block";
          a = w.createNewImageElement(d);
          a.setAttribute("src", f);
          w.pf_preview_current.appendChild(a);
        }
      }, clear_image:function(a) {
        try {
          try {
            var b = a.originalTarget.ownerDocument;
          } catch (f) {
            b = document;
          }
          var c = b.getElementById("pf_preview");
          c.style.display = "none";
          c.style.right = "2px";
          c.style.left = "";
          w.pf_preview_current.innerHTML = "";
        } catch (f) {
        }
      }, add_events:function(a, b, c, f, g) {
        0 <= c.indexOf("#") || (w.tld = f, "pf_prevImg" != b.getAttribute("keepaPreview") && (b.addEventListener("mouseover", function(b) {
          w.preview_image(a, b, c, g, f);
          return !0;
        }, !0), b.addEventListener("mouseout", function(a) {
          w.clear_image(a);
        }, !1), b.setAttribute("keepaPreview", "pf_prevImg")));
      }};
    }
  }
})();

