# Count.ly Titanium iOS SDK

Countly is an innovative, real-time, open source mobile analytics application. It collects data from mobile phones, and visualizes this information to analyze mobile application usage and end-user behavior. There are two parts of Countly: the server that collects and analyzes data, and mobile SDK that sends this data (for iOS & Android).

Countly Server;

- [Countly Server (countly-server)](https://github.com/Countly/countly-server)

Other Countly SDK repositories;

- [Countly Android SDK (countly-sdk-android)](https://github.com/Countly/countly-sdk-android)
- [Countly iOS SDK (countly-sdk-ios)](https://github.com/Countly/countly-sdk-ios)


## Installation

Clone git repo and move to Titanium Modules Folder
```
$ git clone https://github.com/euforic/Ti-Count.ly.git
$ cd Ti-Count.ly
$ cp count.ly-iphone-0.2.1.zip /Library/Application Support/Titanium/
```

Register your module with your application by editing `tiapp.xml` and adding your module.

```
<modules>
  <module version="0.2.1">count.ly</module>
</modules>
```

## Usage

### Start Count.ly

**Start Tracking**
```
var countly = require('count.ly');
countly.start('APP_KEY','http://API_HOST.com');
```

### Record Events

**Fields**

- name : Name of the event to track
  - _(example - Track clicks on the help button "clickedHelp" )_
- count : Number to increment the event in the db
  - _(example - User purchases item increment by 1 )_
- sum : Sum of the event's action
  - _(example - User purchased 3 items at $5 each the sum would be 15)_
- segmentation : Categorization of the event
  - _(example - User is from USA and uses an iPhone 4S so the segmentation will be {device:"iPhone 4S", country:"USA"} )_

**Simple Event**
```
countly.event({
    name:'entered-store'
  , count:1
});
```

**Event With Sum**
```
countly.event({
    name:'purchased-credits'
  , count:3
  , sum:18
});
```

**Event with Segmentation**
```
countly.event({
    name:'opened-chats'
  , count:4
  , segmentation:{device:"iPhone 4S", country:"USA"}
});
```

**Event with Segmentation and Sum**
```
countly.event({
    name:'purchase'
  , count:5
  , sum:100
  , segmentation:{app_version:"1.0", item:"Sword"}
});
```

### Metrics Data

```
console.log('device',countly.device);
console.log('deviceName',countly.deviceName);
console.log('devicePlatform',countly.platform)
console.log('multitaskingSupported',countly.multitaskingSupported);
console.log('orientation', countly.orientation);
console.log('osVersion', countly.osVersion);
console.log('carrier', countly.carrier);
console.log('resolution', countly.resolution);
console.log('locale',countly.locale);
console.log('appVersion',countly.appVersion);
console.log('osVersion',countly.osVersion);
```

## License

(The MIT License)

Copyright (c) 2012 Christian Sullivan &lt;cs@euforic.co&gt;

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.