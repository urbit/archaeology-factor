$ ->
  rece = React.createElement
  recf = React.createFactory
  recl = React.createClass
  [div,h1] = [React.DOM.div,React.DOM.h1]

  Rout = ReactRouter
  link = recf Rout.Link
  dero = recf Rout.DefaultRoute
  rout = recf Rout.Route
  roth = Rout.RouteHandler

  modules = {
    work:window.work
    talk:window.talk
  }

  for k,v of modules
    v.init()

  talk = recl
    render: ->
      (div {}, [
        (h1 {}, "talk")])

  blan = recl
    render: ->
      (div {}, "")

  beam = recl
    render: ->
      (div {}, [
        (h1 {}, "beam")
        (link {to:"talk"}, "talk")
        (link {to:"work"}, "work")
        (rece roth,null)])

  routes =
    (rout {
      name:"beam",
      handler:beam
      path:"/"}, [
        (rout {name:"talk", handler:window.talk.Component},""),
        (rout {name:"work", handler:window.work.Component},""),
        (dero {name:"root", handler:blan},"")
      ])

  Rout.run routes, (h) -> 
    React.render (rece h),$('#c')[0]