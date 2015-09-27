// include jquery
var jq = document.createElement('script');
jq.src = "https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js";
document.getElementsByTagName('head')[0].appendChild(jq);

// delay func
delay = function(ms, func) {
  setTimeout(func, ms);
}

// http://zackehh.com/handling-synchronous-asynchronous-loops-javascriptnode-js/
function syncLoop(iterations, process, exit){
    var index = 0,
        done = false,
        shouldExit = false;
    var loop = {
        next:function(){
            if(done){
                if(shouldExit && exit){
                    return exit(); // Exit if we're done
                }
            }
            // If we're not finished
            if(index < iterations){
                index++; // Increment our index
                process(loop); // Run our process, pass in the loop
            // Otherwise we're done
            } else {
                done = true; // Make sure we say we're done
                if(exit) exit(); // Call the callback on exit
            }
        },
        iteration:function(){
            return index - 1; // Return the loop number we're on
        },
        break:function(end){
            done = true; // End the loop
            shouldExit = end; // Passing end as true means we still call the exit callback
        }
    };
    loop.next();
    return loop;
}

/**
 * oldCategory is the selector e.g. '.sf-category-47-name'
 * and newCategory is a string e.g. 'Restaurants'
 *
 * e.g. to update all Fast Food to Restaurants
 * bulkUpdate('.sf-category-47-name', 'Restaurants')
 */
bulkUpdate = function(oldCategory, newCategory) {
  var nodes = $(oldCategory);
  var iterations = nodes.length

  syncLoop(iterations, function(loop) {
    var idx = loop.iteration();
    console.log('syncLoop ' + idx + ' of ' + iterations);

    delay(2000, function() {
      node = nodes[idx];
      update(node, 'Restaurants');
      loop.next();
    });
  }, function() {
    console.log('done');
  });
}

update = function(node, newCategory) {
  tr = $(node).closest('tr')[0];

  console.log('opening edit modal');
  editButton = $(tr).find('.sf-button-edit');
  editButton.click();

  delay(500, function() {
    console.log('opening categories');
    modal = $('.sf-popup-content');
    opener = modal.find('.sf-button-opener')[0];
    $(opener).click();

    delay(500, function () {
      console.log('clicking category');
      category = $('.sf-sublist').find('div[title="Restaurants"]')[1];
      $(category).click();

      delay(500, function () {
        console.log('saving...');
        saveButton = modal.find('.sf-button-save');
        saveButton.click();
      });
    });
  });
}
