// This is a test harness for your module
// You should do something interesting in this harness 
// to test out the module and to provide instructions 
// to users on how to use it by example.


// open a single window
var win = Ti.UI.createWindow({
	backgroundColor:'white'
});
var label = Ti.UI.createLabel();
win.add(label);
win.open();

// TODO: write your module tests here
var countly = require('count.ly');

countly.start('APP_KEY','http://API_HOST.com');
label.text = JSON.parse(countly.metrics);

Ti.API.info(countly.udid);
Ti.API.info(countly.device);
Ti.API.info(countly.osVersion);
Ti.API.info(countly.carrier);
Ti.API.info(countly.resolution);
Ti.API.info(countly.locale);
Ti.API.info(countly.platform);
Ti.API.info(countly.metrics);