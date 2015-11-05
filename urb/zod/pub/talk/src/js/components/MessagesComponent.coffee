Infinite = require 'react-infinite'
moment = require 'moment-timezone'
clas = require 'classnames'

recl = React.createClass
{div,pre,br,span,input,textarea,a} = React.DOM

MessageActions  = require '../actions/MessageActions.coffee'
MessageStore    = require '../stores/MessageStore.coffee'
StationActions  = require '../actions/StationActions.coffee'
StationStore    = require '../stores/StationStore.coffee'
Member          = require './MemberComponent.coffee'

MESSAGE_HEIGHT = 48 # XX measure

Message = recl
  displayName: "Message"
  lz: (n) -> if n<10 then "0#{n}" else "#{n}"

  convTime: (time) ->
    d = new Date time
    h = @lz d.getHours()
    m = @lz d.getMinutes()
    s = @lz d.getSeconds()
    "~#{h}.#{m}.#{s}"

  _handleAudi: (e) ->
    audi = _.map $(e.target).closest('.audi').find('div'), (div) -> return "~"+$(div).text()
    @props._handleAudi audi

  _handlePm: (e) ->
    return if not @props._handlePm
    user = $(e.target).closest('.iden').text()
    return if user.toLowerCase() is 'system'
    @props._handlePm user

  renderSpeech: (speech)-> switch
    when (con = speech.lin) or (con = speech.app) or
         (con = speech.exp) or (con = speech.tax)
      con.txt
    when (con = speech.url)
      (a {href:con.txt,target:"_blank"}, con.txt)
    when (con = speech.mor) then con.map @renderSpeech
    else "Unknown speech type:" + (" %"+x for x of speech).join ''

  render: ->
    # pendingClass = clas pending: @props.pending isnt "received"
    delivery = _.uniq _.pluck @props.thought.audience, "delivery"
    speech = @props.thought.statement.speech
    attachments = []
    while speech.fat?
      attachments.push pre {}, speech.fat.tor.tank.join("\n")
      speech = speech.fat.taf  # XX
    if !speech? then return;
    
    name = if @props.name then @props.name else ""
    aude = _.keys @props.thought.audience
    audi = window.util.clipAudi(aude).map (_audi) -> (div {}, _audi.slice(1))

    mainStation = window.util.mainStationPath(window.urb.user)
    type = if mainStation in aude then 'private' else 'public'

    className = clas {message:true},
      (if @props.sameAs then "same" else "first"),
      (if delivery.indexOf("received") isnt -1 then "received" else "pending"),
      {say: speech.lin?.say is false, url: speech.url, 'new': @props.unseen},
      switch
        when speech.app? then "say"
        when speech.exp? then "exp"
        
    div {className}, [
        (div {className:"attr"}, [
          div {className:"type #{type}", "data-glyph": @props.glyph || "*"}
          (div {onClick:@_handlePm},
           (React.createElement Member,{ship:@props.ship,glyph:@props.glyph}))
          div {onClick:@_handleAudi,className:"audi"}, audi
          div {className:"time"}, @convTime @props.thought.statement.date
        ])
        
        div {className:"mess"}, 
          (@renderSpeech speech)
          if attachments.length
            div {className:"fat"}, attachments
      ]

module.exports = recl
  displayName: "Messages"
  pageSize: 50
  paddingTop: 100

  stateFromStore: -> {
    messages:MessageStore.getAll()
    last:MessageStore.getLast()
    fetching:MessageStore.getFetching()
    listening:MessageStore.getListening()
    station:window.util.mainStation()
    stations:StationStore.getStations()
    configs:StationStore.getConfigs()
    typing:MessageStore.getTyping()
    glyph:StationStore.getGlyphMap()
  }

  getInitialState: -> @stateFromStore()

  _blur: ->
    @focused = false
    @lastSeen = @last

  _focus: ->
    @focused = true
    @lastSeen = null
    $('.message.new').removeClass 'new'
    document.title = document.title.replace /\ \([0-9]*\)/, ""

  checkMore: ->
    if $(window).scrollTop() < @paddingTop &&
        @state.fetching is false &&
        this.state.last &&
        this.state.last > 0
      end = @state.last-@pageSize
      end = 0 if end < 0
      @lastLength = @length
      MessageActions.getMore @state.station,(@state.last+1),end

  setAudience: -> 
    return if @state.typing or not @last
    laudi = _.keys @last.thought.audience
    return if (_.isEmpty laudi) or not
              _(laudi).difference(@state.audi).isEmpty()
      StationActions.setAudience _.keys(@last.thought.audience)

  sortedMessages: (messages) ->
    _.sortBy messages, (message) -> 
          message.pending = message.thought.audience[station]
          message.key
          #message.thought.statement.date

  componentDidMount: ->
    MessageStore.addChangeListener @_onChangeStore
    StationStore.addChangeListener @_onChangeStore
    if @state.station and @state.listening.indexOf(@state.station) is -1
      MessageActions.listenStation @state.station
    $(window).on 'scroll', @checkMore
    @focused = true
    $(window).on 'blur', @_blur
    $(window).on 'focus', @_focus
    window.util.setScroll()

  componentDidUpdate: ->
    $window = $(window)
    if @lastLength
      st = $window.height()
      $window.scrollTop st
      @lastLength = null
    else
      if not window.util.isScrolling()
        window.util.setScroll()
      else
        console.log 'scrolling'

    if @focused is false and @last isnt @lastSeen
      _messages = @sortedMessages @state.messages
      d = _messages.length-_messages.indexOf(@lastSeen)-1
      t = document.title
      if document.title.match(/\([0-9]*\)/)
        document.title = document.title.replace /\([0-9]*\)/, "(#{d})"
      else
        document.title = document.title + " (#{d})" 
      
  componentWillUnmount: ->
    MessageStore.removeChangeListener @_onChangeStore
    StationStore.removeChangeListener @_onChangeStore

  _onChangeStore: -> @setState @stateFromStore()

  _handlePm: (user) ->
    audi = [window.util.mainStationPath(user)]
    if user is window.urb.user then audi.pop()
    StationActions.setAudience audi

  _handleAudi: (audi) -> StationActions.setAudience audi

  render: ->
    station = @state.station
    messages = @sortedMessages @state.messages
    
    @last = messages[messages.length-1]
    if @last?.ship && @last.ship is window.urb.user then @lastSeen = @last
    @length = messages.length

    setTimeout (=> @checkMore() if @length < @pageSize), 1

    lastIndex = if @lastSeen then messages.indexOf(@lastSeen)+1 else null
    lastSaid = null
    
    
    _messages = messages.map (message,index) =>
      nowSaid = [message.ship,message.thought.audience]
      sameAs = _.isEqual lastSaid, nowSaid
      lastSaid = nowSaid

      {speech} = message.thought.statement
      React.createElement Message, (_.extend {}, message, {
        station, sameAs, @_handlePm, @_handleAudi,
        ship: if speech?.app then "system" else message.ship
        glyph: @state.glyph[(_.keys message.thought.audience).join " "]
        unseen: lastIndex and lastIndex is index
      })
        
    (div {id: "messages"},
      React.createElement Infinite, {
          useWindowAsScrollContainer: yes
          elementHeight: MESSAGE_HEIGHT
        }, _messages
    )
