WorkActions = require '../actions/WorkActions.coffee'

module.exports = 
  listen: () ->
    window.urb.subscribe {
      appl:'work'
      path:'/r'
    }, (err,res) ->
      console.log 'sub'
      console.log arguments
      if not err and not res.data?.ok then WorkActions.loadItems res.data
  
  createItem: (sort,serial,title) ->
    window.urb.send {
        appl:'work'
        mark:'work-command'
        data:
          create:
            sort:sort
            task:
              serial:serial
              title:title
      }, (err,res) ->
        console.log 'sent'
        console.log arguments

  updateItem: (sort,serial,title) ->
    window.urb.send {
        appl:'work'
        mark:'work-command'
        data:
          update:
            sort:sort
            task:
              serial:serial
              title:title
      }, (err,res) ->
        console.log 'sent'
        console.log arguments

  removeItem: (serial) ->
    window.urb.send {
      appl:'work'
      mark:'work-command'
      data:
        delete:serial
    }