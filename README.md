money-logic-cli
===============

A javascript CLI for BMO Money Logic circa 2014. I added a bulkUpdate function which let you mass re-assign a category since at that time Money Logic did't have bulk operations. It was a little buggy and you had to stay focused on the window or else it crashed. I think the site detected inactivity and paused any running scripts. I used it to do a large re-classification that would have taken a while to do manually. The site now has this feature built in.

Usage:
------

First you need to include the script:

```javascript
  var script = document.createElement('script');
  script.src = "https://rawgit.com/kevinhughes27/money-logic-cli/master/build/bundle.js";
  document.getElementsByTagName('head')[0].appendChild(script);
```

then:

```javascript
  moneyLogicCli.bulkUpdate('Fast food', 'Restaurants')
```

or

```javascript
  moneyLogicCli.amountRule('-$1,600.00', 'Mortgage/Rent')
```

Disclaimer:
-----------

You probably shouldn't use this script unless you've read and understood every line of code in it. The usage documentation above was intended for myself and this project should serve as an interesting example of adding javascript to enhance a website you use.
