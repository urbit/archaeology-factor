EventEmitter  = require('events').EventEmitter
assign        = require 'object-assign'
Dispatcher    = require '../dispatcher/Dispatcher.coffee'

_upcoming   = []
_following  = []
_incoming   = []

lists =
  'upcoming':_upcoming
  'following':_following
  'incoming':_incoming

#ok

WorkStore = assign {},EventEmitter.prototype,{
  emitChange: -> @emit 'change'
  addChangeListener: (cb) -> @on 'change', cb
  removeChangeListener: (cb) -> @removeListener "change", cb
  
  getList: (key) -> lists[key]

  getItem: (serial,index) ->
    item =
      serial:serial
      sort:index
      title:' '
      modified: new Date()
      created: new Date()
      due:null
      comments:[]
      tags:[]
      attn:null
      owner:"~talsur-todres"
    item

  newItem: ({index,list,serial}) ->
    list = lists[list]
    list.splice index,0,@getItem serial,index

  updateItem: ({index,list,item}) ->
    list = lists[list]
    _item = _.find list,(_item) ->
      _item.serial is item.serial
    list.splice list.indexOf(_item),1
    list.splice index,0,_item 

  swapItem: ({from,list,to}) ->
    console.log 'swap'

  removeItem: ({index,list}) -> 
    list = lists[list]
    list.splice index,1

  loadItems: ({list,items}) ->
    # for now, we need to upgrade these incoming ones
    for k,i of items
      items[k] = _.merge @getItem(i.serial,k),i
    lists[list] = items
}

WorkStore.setMaxListeners 100

WorkStore.dispatchToken = Dispatcher.register (p) ->
  a = p.action

  if WorkStore[a.type]
    WorkStore[a.type] a
    WorkStore.emitChange()

module.exports = WorkStore