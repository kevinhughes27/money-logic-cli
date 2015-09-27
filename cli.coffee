$        = require('jquery-browserify')
delay    = require('./utils.coffee').delay

LoopNext = require('loopnext')
syncLoop = new LoopNext().syncLoop

# oldCategory is the selector e.g. '.sf-category-47-name'
# and newCategory is a string e.g. 'Restaurants'
#
# e.g. to update all Fast Food to Restaurants
# bulkUpdate('.sf-category-47-name', 'Restaurants')
#
exports.bulkUpdate = (oldCategory, newCategory) ->
  nodes = $(oldCategory)
  iterations = nodes.length

  syncLoop(iterations, (l) ->
    idx = l.iteration()
    console.log("syncLoop #{idx} of #{iterations}")

    delay 2000, ->
      node = nodes[idx]
      update(node, newCategory)
      l.next()
  )

  console.log('syncLoop done')

update = (node, newCategory) ->
  tr = $(node).closest('tr')[0]

  console.log('opening edit modal')
  editButton = $(tr).find('.sf-button-edit')
  editButton.click()

  delay 500, ->
    console.log('opening categories')
    modal = $('.sf-popup-content')
    opener = modal.find('.sf-button-opener')[0]
    $(opener).click()

    delay 500, ->
      console.log('clicking category')
      category = $('.sf-sublist').find('div[title="Restaurants"]')[1]
      $(category).click()

      delay 500, ->
        console.log('saving...')
        saveButton = modal.find('.sf-button-save')
        saveButton.click()
