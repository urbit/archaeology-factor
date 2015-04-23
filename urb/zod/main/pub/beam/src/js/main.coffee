$ ->
  rece = React.createElement
  recf = React.createFactory
  recl = React.createClass
  [div,h1] = [React.DOM.div,React.DOM.h1]

  Rout = ReactRouter
  dero = recf Rout.DefaultRoute
  rout = recf Rout.Route
  roth = Rout.RouteHandler

  talk = recl
    render: ->
      (div {}, [
        (h1 {}, "talk")])

  work = recl
    render: ->
      (div {}, [
        (h1 {}, "work")])

  beam = recl
    render: ->
      (div {}, [
        (h1 {}, "beam"),
        (rece roth,null)])

  routes =
    (rout {
      name:"beam",
      handler:beam
      path:"/"}, [
        (rout {name:"talk", handler:talk},""),
        (dero {name:"work", handler:work},"")])

  Rout.run routes, (h) -> 
    React.render (rece h),document.body