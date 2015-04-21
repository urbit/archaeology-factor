WorkActions = '../actions/WorkActions.coffee'

module.exports = 
  listen: () ->
    window.urb.subscribe {
      appl:'work'
      path:'/r'
    }, (err,res) ->
      if not err and res.list then WorkActions.load res.list
  
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

  deleteItem: (serial) ->
    window.urb.send {
      appl:'work'
      mark:'work-command'
      data:
        delete:serial
    }