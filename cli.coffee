$        = require('jquery-browserify')
delay    = require('./utils.coffee').delay

LoopNext = require('loopnext')
syncLoop = new LoopNext().syncLoop

# oldCategory is the selector e.g. '.sf-category-47-name'
# and newCategory is a string e.g. 'Restaurants'
#
# e.g. to update all Fast Food to Restaurants
# bulkUpdate('Fast food', 'Restaurants')
#
# *Note only works if you filter down to just the sub category you are bulk updating
#
exports.bulkUpdate = (oldCategory, newCategory) ->
  selector = selectorForCategory(oldCategory)

  nodes = $(selector)
  iterations = nodes.length

  syncLoop(iterations, (l) ->
    idx = l.iteration()
    console.log("syncLoop #{idx} of #{iterations}")

    delay 2000, ->
      node = nodes[idx]
      update(node, newCategory)
      l.next()
  )

selectorForCategory = (name) ->
  node = $('td[data-col="Category"]').find(".sf-sub-cat:contains('#{name}')")[0]
  $span = $(node).find("span:contains('#{name}')")
  selector = "." + $span.attr('class')
  console.log("selector = #{selector} for category '#{name}'")
  selector

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
      category = $('.sf-sublist').find("div[title='#{newCategory}']")[1]
      $(category).click()

      delay 500, ->
        console.log('saving...')
        saveButton = modal.find('.sf-button-save')
        saveButton.click()
