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

  blan = recl
    render: ->
      (div {}, "")

  beam = recl
    render: ->
      if window.urb.user is window.urb.ship
        whom = [(div {className:'user ship'}, "~"+window.urb.user)]
      else
        whom = [(div {className:'user'}, "~"+window.urb.user)
                (div {className:'ship'}, "~"+window.urb.ship)]
      (div {}, [
        (div {id:"beam"},[
          (div {className:"mods"},[
            (div {className:"links"}, [
              (link {to:"talk"}, "talk")
              (link {to:"work"}, "work")
            ])
            (div {className:"caret"}, "")
          ])
          (div {className:"whom"}, whom)
        ])
        (div {id:"c"}, [
          (rece roth,null)
        ])
      ])

  routes =
    (rout {
      name:"beam",
      handler:beam
      path:"/"}, [
        (rout {name:"talk", handler:window.talk.Component},""),
        (rout {name:"work", handler:window.work.Component},""),
        (dero {name:"root", handler:blan},"")
      ])

  Rout.run routes, (h) -> React.render (rece h),document.body