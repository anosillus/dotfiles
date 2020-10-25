document.addEventListener('DOMContentLoaded', function () {
	var id=chrome.extension.getBackgroundPage();
	chrome.tabs.query( {'active': true, currentWindow: true}, function(tabArray) {
		var hostname=id.getHostname(tabArray[0].url);
		if (id.ispvt(hostname)) {
			document.getElementById("location_img").src = "images/flags/pvt48.png";
			document.getElementById("location_name").innerText = "Private connection";
			document.getElementById("location_name2").innerText = "Localhost or Private IP address";
			document.getElementById("moreinfo").style.display = "none";
		} else {
			var cache = locache.get(id.flagutils.cachePrefix + hostname);
			if (cache!=null) {
				var r = cache[0];
				if (r.ipv4countrycode == "unknown") {
					document.getElementById("location_img").src = "images/flags/pvt48.png";
					document.getElementById("location_name").innerText = "No location";
					document.getElementById("location_name2").innerText = "No IP address found!";
					document.getElementById("moreinfo").style.display = "none";
				} else {
					var location_name=r.ipv4locbanner.split(',');
					var country=location_name[location_name.length-1];
					location_name.pop();
					document.getElementById("location_img").src = "images/flags/48/" +  r.ipv4countrycode.toUpperCase() + ".png";
					document.getElementById("location_name").innerText = country;
					document.getElementById("location_name2").innerText = location_name.toString();
					if (r.ipv4 != "") {
						document.getElementById("ipaddress").href = "https://dnslytics.com/ip/" + r.ipv4 + "?utm_source=addon&utm_medium=ipaddress&utm_campaign=ipdomainflag";
						document.getElementById("ipaddress").innerText = r.ipv4
					}
					if (r.ipv4asn != "") {
						document.getElementById("isp").href = "https://dnslytics.com/bgp/as" + r.ipv4asn + "?utm_source=addon&utm_medium=asn&utm_campaign=ipdomainflag";
						document.getElementById("isp").innerText = r.ipv4asnshortname
					}
					if (r.domain != "") {
						document.getElementById("domain").href = "https://dnslytics.com/domain/" + r.domain + "?utm_source=addon&utm_medium=domain&utm_campaign=ipdomainflag";
						document.getElementById("domain").innerText = r.domain
					}
					if (r.alexarank > 0) {
						document.getElementById("alexa").innerText = "Alexa ranking: " + r.alexarank;
					} else {
						document.getElementById("alexa").innerText = "Alexa ranking: not in top million";
					}
					if (r.domainrank > 0) {
						document.getElementById("domainrank").innerText = "Domain ranking: " + r.domainrank + "/100";
					} else {
						document.getElementById("domainrank").innerText = "Domain ranking: no ranking";
					}
				}
			} else {
				document.getElementById("location_img").src = "images/flags/pvt48.png";
				document.getElementById("location_name").innerText = "No location";
				document.getElementById("location_name2").innerText = "No IP address found!";
				document.getElementById("moreinfo").style.display = "none";				
			}
		}
	});

});