var flagutils = {
	ajaxtimeout : 10000,
	cachetimeout: 3600*24*7,
	tabid: -1,
	cachePrefix: "_",
	debugmode: false
};

window.onload = loadconfig();

chrome.tabs.onUpdated.addListener(function(tabId, changeInfo, tab) {
	if (changeInfo.status == "loading") onUpdated(tab);
});

function loadconfig () {
	locache.cleanup();
}

function setflag (country_code,title) {
	if (flagutils.debugmode) console.log('set icon -' + flagutils.tabid + ' ' + country_code + ' ' + title);
	if (country_code == "pvt" || country_code =="unknown") {
		icon = {
			'16': 'images/flags/pvt16.png',
			'24': 'images/flags/pvt24.png',
			'32': 'images/flags/pvt32.png',
			'48': 'images/flags/pvt48.png',
			'64': 'images/flags/pvt64.png'
		}
	} else {
		cc = country_code.toUpperCase()
		icon = {
			'16': 'images/flags/16/' + cc + '.png',
			'24': 'images/flags/24/' + cc + '.png',
			'32': 'images/flags/32/' + cc + '.png',
			'48': 'images/flags/48/' + cc + '.png',
			'64': 'images/flags/64/' + cc + '.png'
		}
	}
	chrome.pageAction.setIcon({path: icon,tabId: flagutils.tabid});
	chrome.pageAction.setTitle({title: title,tabId: flagutils.tabid});
	chrome.pageAction.show(flagutils.tabid);
}

function onApiResultSuccess(r) {
	if (r.ipv4countrycode != null && r.ipv4countrycode != "") {
		setflag(r.ipv4countrycode,r.ipv4locbanner);
		locache.set(flagutils.cachePrefix + r.hostname, [r], flagutils.cachetimeout);
	} else {
		onApiResultError();
		locache.set(flagutils.cachePrefix + r.hostname, [{"ipv4countrycode":"unknown", "ipv4locbanner":"Unknown location"}], flagutils.cachetimeout);
	}
}

function onApiResultError(r) {
	if (flagutils.debugmode) console.log('api call error');
	setflag('unknown','Unknown location');
}

function apicall(hostname) {
	var xhr = new XMLHttpRequest();
	xhr.open("GET", "https://addon.dnslytics.net/flaginfo/v1/" + hostname, true);
	xhr.timeout = flagutils.ajaxtimeout;
	xhr.onreadystatechange = function() {
		if (xhr.readyState == XMLHttpRequest.DONE) {
			if (xhr.status == 200) {
				var resp = JSON.parse(xhr.responseText);
				onApiResultSuccess(resp);
			} else {
				onApiResultError(resp)
			}
		}
	}
	xhr.send();
}

function onUpdated(tab) {
	flagutils.tabid=tab.id;
	var hostname = getHostname(tab.url);
	if (hostname) {
		hostname=punycode.toASCII(hostname);
		if (ispvt(hostname)) {
			setflag('pvt','Localhost or Private IP address');
		} else {
			var cache = locache.get(flagutils.cachePrefix + hostname);
			if (cache!=null) {
				if (flagutils.debugmode) console.log('cache hit - ' + hostname);
				setflag(cache[0].ipv4countrycode,cache[0].ipv4locbanner);
			} else {
				if (flagutils.debugmode) console.log('start api call - ' + hostname);
				apicall(hostname);
			}
		}
	}
}

function getHostname(str) {
	try {
		var re = new RegExp('^(?:f|ht)tp(?:s)?\://([^/|:]+)', 'im');
		return str.match(re)[1].toString();
	} catch (e) {
		return null;
	}
};

function ispvt(hostname) {
	var re = /^((^[a-z0-9-_]+$)|((10|127)\.\d+|(172\.(1[6-9]|2[0-9]|3[01])|192\.168))\.\d+\.\d+)$/i;
	return re.test(hostname);
}