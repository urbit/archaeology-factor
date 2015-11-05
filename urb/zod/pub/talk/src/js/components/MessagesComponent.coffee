Infinite = require 'react-infinite'

recl = React.createClass
{div} = React.DOM

MessageActions  = require '../actions/MessageActions.coffee'
MessageStore    = require '../stores/MessageStore.coffee'
StationActions  = require '../actions/StationActions.coffee'
StationStore    = require '../stores/StationStore.coffee'
Message         = require './MessageComponent.coffee'

MESSAGE_HEIGHT = 48 # XX measure

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
    window.util.scrollToBottom()

  componentWillUpdate: ->
    $window = $(window)
    if ($('#writing').is -> 
         $(@).offset().top < $window.scrollTop() + $window.height()
        )
      @anchorKey = Number.MAX_VALUE
    else
      @anchorKey = $('.message').first().attr('data-index') ? 0
    
  componentDidUpdate: (_props, _state)->
    $window = $ window
    scrollTop = $window.scrollTop()
    old = {}; old[key] = true for {key} in _state.messages
    for {key} in @state.messages when not old[key] and key < @anchorKey
      scrollTop += MESSAGE_HEIGHT
    $window.scrollTop scrollTop

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
        index: message.key
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
