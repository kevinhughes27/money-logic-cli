money-logic-cli
===============

A javascript CLI for BMO Money Logic. So far the only function is bulkUpdate which lets you mass re-assign a category since Money Logic doesn't have bulk operations. I think the browser window needs to stay active or execution might get cut off by something.

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

More features coming as I need them.
