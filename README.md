# Count.ly Titanium iOS SDK

Countly is an innovative, real-time, open source mobile analytics application. It collects data from mobile phones, and visualizes this information to analyze mobile application usage and end-user behavior. There are two parts of Countly: the server that collects and analyzes data, and mobile SDK that sends this data (for iOS & Android).

Countly Server;

- [Countly Server (countly-server)](https://github.com/Countly/countly-server)

Other Countly SDK repositories;

- [Countly Android SDK (countly-sdk-android)](https://github.com/Countly/countly-sdk-android)

## Installation

Clone git repo and move to Titanium Modules Folder
```
$ git clone https://github.com/euforic/Ti-Count.ly.git
$ cd Ti-Count.ly
$ cp count.ly-iphone-0.2.0.zip /Library/Application Support/Titanium/
```

Register your module with your application by editing `tiapp.xml` and adding your module.

```
<modules>
  <module version="0.2.0">count.ly</module>
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
- segmentation : Increment Multiple values with in the event
  - _(example - User updates 3 fields in there profile you could increment the profile changes {name:1,hometown:1,dob:1} )_

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
  , segmentation:{dave:1, sue:1, tom:2 }
});
```

**Event with Segmentation and Sum**
```
countly.event({
    name:'purchase'
  , count:5
  , sum:100
  , segmentation:{dogs:2, cats:1, mice:1, treats:1 }
});
```

### Metrics Data

```
Ti.API.info(countly.device);
Ti.API.info(countly.osVersion);
Ti.API.info(countly.carrier);
Ti.API.info(countly.resolution);
Ti.API.info(countly.locale);
Ti.API.info(countly.appVersion);
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