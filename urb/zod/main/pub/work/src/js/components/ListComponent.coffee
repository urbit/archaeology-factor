recl = React.createClass
rece = React.createElement
[div,h1,input,textarea] = [React.DOM.div,React.DOM.h1,React.DOM.input,React.DOM.textarea]

WorkStore     = require '../stores/WorkStore.coffee'
WorkActions   = require '../actions/WorkActions.coffee'
ItemComponent = require './ItemComponent.coffee'

module.exports = recl
  stateFromStore: -> {
    list:WorkStore.getList @props.list
    expand:false
  }

  getInitialState: -> @stateFromStore()
  _onChangeStore: -> @setState @stateFromStore()

  alias: ->
    @$el = $ @getDOMNode()
    @$items = @$el.find('.items').children()

  _focus: (e,i) -> @setState {selected:Number(i.props.index)}

  _blur: (e,i) -> @update i

  _click: -> if @state.list.length is 0 then WorkActions.newItem 0,@props.list

  _dragStart: (e,i) -> @dragged = i.dragged

  _dragEnd: (e,i) -> 
    WorkActions.swapItems @dragged.attr('data-index'),@props.list,@over
    @dragged.removeClass 'hidden'
    @placeholder.remove()

  _dragOver: (e,i) ->
    e.preventDefault()
    $i = $(e.target).closest('.item')
    @over = Number $i.attr 'data-index'
    if not @dragged.hasClass('hidden') then @dragged.addClass 'hidden'
    @placeholder.insertBefore $i

  _keyDown: (e,i) ->
    kc = e.keyCode

    switch kc
      # enter - add new
      when 13
        if window.getSelection().getRangeAt(0).endOffset is 0
          ins = @state.selected
        else
          ins = @state.selected+1
          @setState {selected:ins,select:true}
        WorkActions.newItem ins,@props.list
      # backspace - remove if at 0
      when 8
        if window.getSelection().getRangeAt(0).endOffset is 0 and
        e.target.innerText.length is 0
          if @state.selected isnt 0
            @setState {selected:@state.selected-1,select:"end"}
          WorkActions.removeItem @state.selected,@props.list,i.props.item.serial
          e.preventDefault()
      # up
      when 38
        last = @state.selected-1
        if last<0 then last = @state.list.length-1
        @$items.eq(last).find('.title .input').focus()
        @setState {select:"end"}
      # down
      when 40
        next = @state.selected+1
        if next is @state.list.length then next = 0
        @$items.eq(next).find('.title .input').focus()
        @setState {select:"end"}

    # cancel these
    if (kc is 13) or (kc is 38) or (kc is 40) then e.preventDefault()

  update: (i) -> 
    item = _.merge i.props.item,i.state
    WorkActions.updateItem i.props.index,@props.list,item

  componentDidMount: -> 
    @placeholder = $ "<div class='item placeholder'><div class='sort'>x</div></div>"
    WorkStore.addChangeListener @_onChangeStore
    @alias()

  componentDidUpdate: -> 
    @alias()
    if @state.selected isnt undefined or @state.select
      $title = @$items.eq(@state.selected).find('.title .input')
    if @state.selected isnt undefined and @state.select
      $title.focus()
    if @state.select is "end"
      r = window.getSelection().getRangeAt(0)
      r.setStart $title[0],1
      r.setEnd $title[0],1
      s = window.getSelection()
      s.removeAllRanges()
      s.addRange r
    if @state.select
      @setState {select:false}

  render: ->
    (div {}, [
      (h1 {}, @props.list),
      (div {
        className:'items'
        onDragOver:@_dragOver
        onClick:@_click
        }, [
          _.map @state.list,(item,index) => 
            rece(ItemComponent,{
              item
              index
              @_focus
              @_blur
              @_keyDown
              @_dragStart
              @_dragOver
              @_dragEnd})
      ])
    ])