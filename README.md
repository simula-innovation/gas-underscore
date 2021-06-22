Underscore
==========
Underscore for Google Apps Script is a library that enables the
use of the
[underscore.js](http://underscorejs.org)
library in
[Google Apps Script](https://developers.google.com/google-apps/).
API docs are available
[here](https://script.google.com/macros/library/versions/d/M3i7wmUA_5n0NSEaa6NnNqOBao7QLBR4j).

Adding the library to your project
----------------------------------
Underscore for Google Apps Script is made available as a script
library. This is how you add it to your project:

1. Select "Resources" > "Libraries..." in the Google Apps Script
editor.
2. Enter the script id (`1PcEHcGVC1njZd8SfXtmgQk19djwVd2GrrW1gd7U5hNk033tzi6IUvIAV`) in the
"Find a Library" field, and choose "Select". (If you have copied the
library, enter instead the project key of your copy.)
3. Select the highest version number, and choose Underscore as the
identifier. (Do not turn on Development Mode unless you know what you
are doing. The development version may not work.)
4. Press Save. You can now use the Underscore library in your code.

If you want to combine Underscore with
[Underscore.string for Google Apps Script](https://github.com/simula-innovation/gas-underscore.string),
then also add its project key by following
[these instructions](https://github.com/simula-innovation/gas-underscore.string#adding-the-library-to-your-project).

Loading the library
-------------------
To load Underscore:

```
var _ = Underscore.load();
```

To extend the Underscore library object with string functions, see
[Underscore.string for Google Apps Script](https://github.com/simula-innovation/gas-underscore.string#loading-the-library).

Copying the library
-------------------
A Google Apps Script project for Underscore is available
[here](https://script.google.com/d/1PcEHcGVC1njZd8SfXtmgQk19djwVd2GrrW1gd7U5hNk033tzi6IUvIAV/edit).

To copy the library, Select "File" > "Make a copy..." in the Google
Apps Script editor.

Testing the library
-------------------
Underscore can partially be tested with
[QUnit for Google Apps Script](https://github.com/simula-innovation/qunit/tree/gas/gas).

Click
[here](https://script.google.com/macros/s/AKfycbw16xPLgWt-YXKBr6ZUKpPzp0BgWoLWgrczlx4CvbIb8Vg9FjY/exec)
to run the tests (and wait for the test results to show up.)

There is also a
[Google Apps Script project for the Underscore test suite](https://script.google.com/d/1V6wZYu_GJ9ydV0wRCBEprqwy9aRx20L5QWLpUpVlzDWGYdd9FLPvNkTc/edit)
available.

License
-------
Underscore for Google Apps Script is released under the MIT license.
