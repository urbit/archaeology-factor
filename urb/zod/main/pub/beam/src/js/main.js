(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({"/Users/galen/Documents/src/urbit-test/urb/zod/main/pub/beam/src/js/main.coffee":[function(require,module,exports){
$(function() {
  var Rout, beam, dero, div, h1, rece, recf, recl, ref, roth, rout, routes, talk, work;
  rece = React.createElement;
  recf = React.createFactory;
  recl = React.createClass;
  ref = [React.DOM.div, React.DOM.h1], div = ref[0], h1 = ref[1];
  Rout = ReactRouter;
  dero = recf(Rout.DefaultRoute);
  rout = recf(Rout.Route);
  roth = Rout.RouteHandler;
  talk = recl({
    render: function() {
      return div({}, [h1({}, "talk")]);
    }
  });
  work = recl({
    render: function() {
      return div({}, [h1({}, "work")]);
    }
  });
  beam = recl({
    render: function() {
      return div({}, [h1({}, "beam"), rece(roth, null)]);
    }
  });
  routes = rout({
    name: "beam",
    handler: beam,
    path: "/"
  }, [
    rout({
      name: "talk",
      handler: talk
    }, ""), dero({
      name: "work",
      handler: work
    }, "")
  ]);
  return Rout.run(routes, function(h) {
    return React.render(rece(h), document.body);
  });
});



},{}]},{},["/Users/galen/Documents/src/urbit-test/urb/zod/main/pub/beam/src/js/main.coffee"]);
