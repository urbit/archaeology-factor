if not window.util then window.util = {}
_.merge window.util,
  mainStations: ["court","floor","porch"]
  
  mainStationPath: (user) -> "~#{user}/#{window.util.mainStation(user)}"

  mainStation: (user) ->
    if not user then user = window.urb.user
    switch user.length
      when 3
        return "court"
      when 6
        return "floor"
      when 13
        return "porch"

  clipAudi: (audi) ->
    audi = audi.join " "
    ms = window.util.mainStationPath window.urb.user
    regx = new RegExp "/#{ms}","g"
    audi = audi.replace regx,""
    audi.split " "

  expandAudi: (audi) ->
    audi = audi.join " "
    ms = window.util.mainStationPath window.urb.user
    if audi.indexOf(ms) is -1 
      if audi.length > 0
        audi += " "
      audi += "#{ms}"
    audi.split " "

  create: (name) ->
    window.talk.StationPersistence.createStation name, (err,res) ->
  
  subscribe: (name) ->
    window.talk.StationPersistence.addSource "main",window.urb.ship,["~zod/#{name}"]
  
  uuid32: ->
    str = "0v"
    str += Math.ceil(Math.random()*8)+"."
    for i in [0..5]
      _str = Math.ceil(Math.random()*10000000).toString(32)
      _str = ("00000"+_str).substr(-5,5)
      str += _str+"."
    str.slice(0,-1)

  populate: (station,number) ->
    c = 0
    send = ->
      if c < number
        c++
      else
        console.log 'done'
        return true
      _audi = {}
      _audi[station] = "pending"
      _message =
        serial:window.util.uuid32()
        audience:_audi
        statement:
          speech:
            say:"Message "+c
          time: Date.now()
          now: Date.now()
      window.talk.MessagePersistence.sendMessage _message,send
    send()

  scrollToBottom: -> $(window).scrollTop($("#c").height())

  checkScroll: ->
    if window.util.isScrolling()
      $('body').addClass 'scrolling'
    else
      $('body').removeClass 'scrolling'
