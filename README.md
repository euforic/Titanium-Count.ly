# Count.ly Titanium iOS SDK

Countly is an innovative, real-time, open source mobile analytics application. It collects data from mobile phones, and visualizes this information to analyze mobile application usage and end-user behavior. There are two parts of Countly: the server that collects and analyzes data, and mobile SDK that sends this data (for iOS & Android).

Countly Server;

- [Countly Server (countly-server)](https://github.com/Countly/countly-server)

Other Countly SDK repositories;

- [Countly Android SDK (countly-sdk-android)](https://github.com/Countly/countly-sdk-android)

# Install

```
$ git clone https://github.com/euforic/Ti-Count.ly.git
$ cd Ti-Count.ly
$ cp count.ly-iphone-0.1.1.zip /Library/Application Support/Titanium/
```
Register your module with your application by editing `tiapp.xml` and adding your module.
```
<modules>
  <module version="0.1.1">count.ly</module>
</modules>
```
Require you module in whatever js file you plan to use it in
```
var my_module = require('count.ly');
```

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