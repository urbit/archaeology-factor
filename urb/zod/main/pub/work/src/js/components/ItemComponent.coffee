recl = React.createClass
[div] = [React.DOM.div]

WorkActions   = require '../actions/WorkActions.coffee'

module.exports = recl
  _dragStart: (e) ->
    @dragged = $(e.target).closest('.item')
    e.dataTransfer.effectAllowed = 'move'
    e.dataTransfer.setData 'text/html',e.currentTarget
    @props._dragStart e,@
  
  _dragEnd: (e) -> @props._dragEnd e,@

  _keyDown: (e) -> 
    @props._keyDown e,@

    kc = e.keyCode

    switch kc
      # tab - expand
      when 9
        @setState {expand:!@state.expand}
      # esc - collapse
      when 27
        @setState {expand:false}

    if (kc is 9) or (kc is 27) then e.preventDefault()

    $t = $(e.target)
    $p = $t.closest('.input').parent()

    if $p.hasClass 'title'
      @setState {title:$t.text()}

  _blur: (e) -> @props._blur e,@

  _focus: (e) -> @props._focus e,@

  getInitialState: -> {expand:false}

  render: ->
    itemClass = 'item'
    if @state.expand then itemClass += ' expand'

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
            className:'input'
          },@props.item.title)
        ])
        (div {className:'date ib top'}, [
          (div {
            contentEditable:true
            className:'input'
            },@props.item.date)
        ])
        (div {className:'tags ib top'},[
          (div {
            contentEditable:true
            className:'input'
            },@props.item.tags.join(" "))
        ])
        (div {className:'comp ib top'},[
          (div {className:'done a'},"Done")
          (div {className:'rele a'},"Release")
        ])
        (div {className:'caret ib'},"")
        (div {className:"comments"},"comments")
    ])