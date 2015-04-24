(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({"/Users/galen/Documents/src/urbit-test/urb/zod/main/pub/beam/src/js/main.coffee":[function(require,module,exports){
$(function() {
  var Rout, beam, blan, dero, div, h1, k, link, modules, rece, recf, recl, ref, roth, rout, routes, talk, v;
  rece = React.createElement;
  recf = React.createFactory;
  recl = React.createClass;
  ref = [React.DOM.div, React.DOM.h1], div = ref[0], h1 = ref[1];
  Rout = ReactRouter;
  link = recf(Rout.Link);
  dero = recf(Rout.DefaultRoute);
  rout = recf(Rout.Route);
  roth = Rout.RouteHandler;
  modules = {
    work: window.work,
    talk: window.talk
  };
  for (k in modules) {
    v = modules[k];
    v.init();
  }
  talk = recl({
    render: function() {
      return div({}, [h1({}, "talk")]);
    }
  });
  blan = recl({
    render: function() {
      return div({}, "");
    }
  });
  beam = recl({
    render: function() {
      return div({}, [
        h1({}, "beam"), link({
          to: "talk"
        }, "talk"), link({
          to: "work"
        }, "work"), rece(roth, null)
      ]);
    }
  });
  routes = rout({
    name: "beam",
    handler: beam,
    path: "/"
  }, [
    rout({
      name: "talk",
      handler: window.talk.Component
    }, ""), rout({
      name: "work",
      handler: window.work.Component
    }, ""), dero({
      name: "root",
      handler: blan
    }, "")
  ]);
  return Rout.run(routes, function(h) {
    return React.render(rece(h), $('#c')[0]);
  });
});



},{}]},{},["/Users/galen/Documents/src/urbit-test/urb/zod/main/pub/beam/src/js/main.coffee"]);
