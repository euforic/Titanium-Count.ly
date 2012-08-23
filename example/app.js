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
var metrics = JSON.parse(countly.metrics);

metrics.udid = countly.udid;
metrics.carrier = countly.carrier || 'Simulator';
metrics.isSuspended = countly.isSuspended;
label.text = metrics;

Ti.API.info(countly.udid);
Ti.API.info(countly.device);
Ti.API.info(countly.osVersion);
Ti.API.info(countly.carrier);
Ti.API.info(countly.resolution);
Ti.API.info(countly.locale);
Ti.API.info(countly.metrics);