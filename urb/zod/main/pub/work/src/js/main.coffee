WorkPersistence = require './persistence/WorkPersistence.coffee'
WorkComponent   = require './components/WorkComponent.coffee'

$ ->
  window.util = 
    uuid32: ->
      str = "0v"
      str += Math.ceil(Math.random()*8)+"."
      for i in [0..5]
        _str = Math.ceil(Math.random()*10000000).toString(32)
        _str = ("00000"+_str).substr(-5,5)
        str += _str+"."
      str.slice(0,-1)

  window.work =
    Persistence:WorkPersistence
  window.work.Persistence.listen()
  React.render React.createElement(WorkComponent),$('#c')[0]