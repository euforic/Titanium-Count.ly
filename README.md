# Count.ly Titanium iOS SDK

Countly is an innovative, real-time, open source mobile analytics application. It collects data from mobile phones, and visualizes this information to analyze mobile application usage and end-user behavior. There are two parts of Countly: the server that collects and analyzes data, and mobile SDK that sends this data (for iOS & Android).

Countly Server;

- [Countly Server (countly-server)](https://github.com/Countly/countly-server)

Other Countly SDK repositories;

- [Countly Android SDK (countly-sdk-android)](https://github.com/Countly/countly-sdk-android)

## Usage

```
var countly = require('count.ly');
countly.start('APP_KEY','http://API_HOST.com');

//Exposed Info from countly
Ti.API.info(JSON.parse(countly.metrics));
Ti.API.info(countly.udid);
Ti.API.info(countly.device);
Ti.API.info(countly.osVersion);
Ti.API.info(countly.carrier);
Ti.API.info(countly.resolution);
Ti.API.info(countly.locale);
Ti.API.info(countly.platform);
Ti.API.info(countly.metrics);
```

## TODO

Write a real readme