recl = React.createClass
[div] = [React.DOM.div]

WorkActions   = require '../actions/WorkActions.coffee'

module.exports = recl
  _dragStart: (e) ->
    @dragged = $(e.target).closest('.item')
    e.dataTransfer.effectAllowed = 'move'
    e.dataTransfer.setData 'text/html',e.currentTarget
    @props._dragStart e,@

  _expand: -> @setState {expand:!@state.expand}
  
  _dragEnd: (e) -> @props._dragEnd e,@

  _keyDown: (e) -> 
    @props._keyDown e,@

    kc = e.keyCode

    switch kc
      # tab - expand
      when 9
        if !@state.expand is true and not e.shiftKey
          @setState {expand:true}
          e.preventDefault()
        else
          return true
      # esc - collapse
      when 27
        @setState {expand:false}
        e.preventDefault()

  _keyUp: (e) ->
    $t = $(e.target)
    $p = $t.closest('.input').parent()
    if $p.hasClass 'title' then @setState {title:$t.text()}

  _blur: (e) -> @props._blur e,@

  _focus: (e) -> @props._focus e,@

  comment:
    _keyUp: (e) -> console.log 'comment key'
    submit: (e) -> console.log 'comment submit'
      
  getInitialState: -> {expand:false}

  render: ->
    itemClass = 'item'
    if @state.expand then itemClass += ' expand'

    comments = _.map @props.item.comments, (comment) ->
      (div {className:'comment'}, comment)
    comments.push (div {className:'comment-submit'}, [
        (div {
          className:'input'
          onKeyUp:@comment._keyUp
          contentEditable:true}, ""),
        (div {
          className:'submit'
          onClick:@comment.submit
          })])

    (div {
      className:itemClass
      draggable:true
      onDragStart:@_dragStart
      onDragEnd:@_dragEnd
      'data-index':@props.index
      }, [
        (div {className:'sort ib top'},@props.index)
        (div {className:'title ib top'},[
          (div {
            contentEditable:true
            onFocus:@_focus
            onBlur:@_blur
            onKeyDown:@_keyDown
            onKeyUp:@_keyUp
            className:'input'
          },@props.item.title)
        ])
        (div {className:'date ib top'}, [
          (div {
            contentEditable:true
            onKeyDown:@_keyDown
            className:'input'
            },@props.item.date)
        ])
        (div {className:'tags ib top'},[
          (div {
            contentEditable:true
            onKeyDown:@_keyDown
            className:'input'
            },@props.item.tags.join(" "))
        ])
        (div {className:'comp ib top'},[
          (div {className:'done a'},"Done")
          (div {className:'rele a'},"Release")
        ])
        (div {
          className:'caret-container ib p'
          onClick:@_expand
        },[
          (div {className:'caret'},"")
        ])
        (div {className:"comments"},comments)
    ])