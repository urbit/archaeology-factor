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

  removeItem: (index,list,serial) ->
    Dispatcher.handleViewAction
      type:'removeItem'
      index:index
      list:list
    window.work.WorkPersistence.removeItem serial

  loadItems: (items) ->
    Dispatcher.handleViewAction
      type:'loadItems'
      list:'upcoming'
      items:items