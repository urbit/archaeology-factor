Dispatcher = require '../dispatcher/Dispatcher.coffee'

module.exports =
  newItem: (index,list) ->
    serial = window.util.uuid32()
    Dispatcher.handleViewAction
      type:'newItem'
      index:index
      list:list
      serial:serial
    window.work.WorkPersistence.createItem index,serial,' '

  updateItem: (index,list,item) ->
    Dispatcher.handleViewAction
      type:'updateItem'
      index:index
      list:list
      item:item
    window.work.WorkPersistence.updateItem index,item.serial,item.title

  swapItems: (from,list,to) ->
    Dispatcher.handleViewAction
      type:'swapItem'
      from:from
      list:list
      to:to

  removeItem: (index,list) ->
    Dispatcher.handleViewAction
      type:'removeItem'
      index:index
      list:list

  loadItems: (items) ->
    Dispatcher.handleViewAction
      type:'loadItems'
      list:'upcoming'
      items:items