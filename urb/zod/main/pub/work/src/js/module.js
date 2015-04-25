(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({"/Users/galen/src/urbit/urb/zod/main/pub/work/src/js/actions/WorkActions.coffee":[function(require,module,exports){
var Dispatcher;

Dispatcher = require('../dispatcher/Dispatcher.coffee');

module.exports = {
  newItem: function(index, list) {
    var serial;
    serial = window.util.uuid32();
    Dispatcher.handleViewAction({
      type: 'newItem',
      index: index,
      list: list,
      serial: serial
    });
    return window.work.Persistence.createItem(index, serial, ' ');
  },
  updateItem: function(index, list, item) {
    Dispatcher.handleViewAction({
      type: 'updateItem',
      index: index,
      list: list,
      item: item
    });
    return window.work.Persistence.updateItem(index, item.serial, item.title);
  },
  removeItem: function(index, list, serial) {
    Dispatcher.handleViewAction({
      type: 'removeItem',
      index: index,
      list: list
    });
    return window.work.Persistence.removeItem(serial);
  },
  loadItems: function(items) {
    return Dispatcher.handleViewAction({
      type: 'loadItems',
      list: 'upcoming',
      items: items
    });
  }
};



},{"../dispatcher/Dispatcher.coffee":"/Users/galen/src/urbit/urb/zod/main/pub/work/src/js/dispatcher/Dispatcher.coffee"}],"/Users/galen/src/urbit/urb/zod/main/pub/work/src/js/components/ItemComponent.coffee":[function(require,module,exports){
var WorkActions, div, recl;

recl = React.createClass;

div = [React.DOM.div][0];

WorkActions = require('../actions/WorkActions.coffee');

module.exports = recl({
  _dragStart: function(e) {
    this.dragged = $(e.target).closest('.item');
    e.dataTransfer.effectAllowed = 'move';
    e.dataTransfer.setData('text/html', e.currentTarget);
    return this.props._dragStart(e, this);
  },
  _expand: function() {
    return this.setState({
      expand: !this.state.expand
    });
  },
  _dragEnd: function(e) {
    return this.props._dragEnd(e, this);
  },
  _keyDown: function(e) {
    var kc;
    this.props._keyDown(e, this);
    kc = e.keyCode;
    switch (kc) {
      case 9:
        if (!this.state.expand === true && !e.shiftKey) {
          this.setState({
            expand: true
          });
          return e.preventDefault();
        } else {
          return true;
        }
        break;
      case 27:
        this.setState({
          expand: false
        });
        return e.preventDefault();
    }
  },
  _keyUp: function(e) {
    var $p, $t;
    $t = $(e.target);
    $p = $t.closest('.input').parent();
    if ($p.hasClass('title')) {
      return this.setState({
        title: $t.text()
      });
    }
  },
  _blur: function(e) {
    return this.props._blur(e, this);
  },
  _focus: function(e) {
    return this.props._focus(e, this);
  },
  comment: {
    _keyUp: function(e) {
      return console.log('comment key');
    },
    submit: function(e) {
      return console.log('comment submit');
    }
  },
  getInitialState: function() {
    return {
      expand: false
    };
  },
  render: function() {
    var comments, itemClass;
    itemClass = 'item';
    if (this.state.expand) {
      itemClass += ' expand';
    }
    comments = _.map(this.props.item.comments, function(comment) {
      return div({
        className: 'comment'
      }, comment);
    });
    comments.push(div({
      className: 'comment-submit'
    }, [
      div({
        className: 'input',
        onKeyUp: this.comment._keyUp,
        contentEditable: true
      }, ""), div({
        className: 'submit',
        onClick: this.comment.submit
      })
    ]));
    return div({
      className: itemClass,
      draggable: true,
      onDragStart: this._dragStart,
      onDragEnd: this._dragEnd,
      'data-index': this.props.index
    }, [
      div({
        className: 'sort ib top'
      }, this.props.index), div({
        className: 'title ib top'
      }, [
        div({
          contentEditable: true,
          onFocus: this._focus,
          onBlur: this._blur,
          onKeyDown: this._keyDown,
          onKeyUp: this._keyUp,
          className: 'input'
        }, this.props.item.title)
      ]), div({
        className: 'date ib top'
      }, [
        div({
          contentEditable: true,
          onKeyDown: this._keyDown,
          className: 'input'
        }, this.props.item.date)
      ]), div({
        className: 'tags ib top'
      }, [
        div({
          contentEditable: true,
          onKeyDown: this._keyDown,
          className: 'input'
        }, this.props.item.tags.join(" "))
      ]), div({
        className: 'comp ib top'
      }, [
        div({
          className: 'done a'
        }, "Done"), div({
          className: 'rele a'
        }, "Release")
      ]), div({
        className: 'caret-container ib p',
        onClick: this._expand
      }, [
        div({
          className: 'caret'
        }, "")
      ]), div({
        className: "comments"
      }, comments)
    ]);
  }
});



},{"../actions/WorkActions.coffee":"/Users/galen/src/urbit/urb/zod/main/pub/work/src/js/actions/WorkActions.coffee"}],"/Users/galen/src/urbit/urb/zod/main/pub/work/src/js/components/ListComponent.coffee":[function(require,module,exports){
var ItemComponent, WorkActions, WorkStore, div, h1, input, rece, recl, ref, textarea;

recl = React.createClass;

rece = React.createElement;

ref = [React.DOM.div, React.DOM.h1, React.DOM.input, React.DOM.textarea], div = ref[0], h1 = ref[1], input = ref[2], textarea = ref[3];

WorkStore = require('../stores/WorkStore.coffee');

WorkActions = require('../actions/WorkActions.coffee');

ItemComponent = require('./ItemComponent.coffee');

module.exports = recl({
  stateFromStore: function() {
    return {
      list: WorkStore.getList(this.props.list),
      expand: false
    };
  },
  getInitialState: function() {
    return this.stateFromStore();
  },
  _onChangeStore: function() {
    return this.setState(this.stateFromStore());
  },
  alias: function() {
    this.$el = $(this.getDOMNode());
    return this.$items = this.$el.find('.items').children();
  },
  _focus: function(e, i) {
    return this.setState({
      selected: Number(i.props.index)
    });
  },
  _blur: function(e, i) {
    return this.update(i);
  },
  _click: function() {
    if (this.state.list.length === 0) {
      return WorkActions.newItem(0, this.props.list);
    }
  },
  _dragStart: function(e, i) {
    return this.dragged = i.dragged;
  },
  _dragEnd: function(e, i) {
    var from, to, update;
    from = Number(this.dragged.attr('data-index'));
    to = Number(this.over.attr('data-index'));
    if (from < to) {
      to--;
    }
    if (this.drop === 'after') {
      to++;
    }
    i.setState({
      index: String(to)
    });
    update = this.update;
    setTimeout(function() {
      return update(i);
    }, 0);
    this.dragged.removeClass('hidden');
    return this.placeholder.remove();
  },
  _dragOver: function(e, i) {
    var $t;
    e.preventDefault();
    $t = $(e.target).closest('.item');
    if ($t.hasClass('placeholder')) {
      return;
    }
    if (!$t[0]) {
      return;
    }
    if (!this.dragged.hasClass('hidden')) {
      this.dragged.addClass('hidden');
    }
    if ((e.clientY - $t[0].offsetTop) < ($t[0].offsetHeight / 2)) {
      this.drop = 'before';
      this.placeholder.insertBefore($t);
    } else {
      this.drop = 'after';
      this.placeholder.insertAfter($t);
    }
    return this.over = $t;
  },
  _keyDown: function(e, i) {
    var ins, kc, last, next;
    kc = e.keyCode;
    switch (kc) {
      case 13:
        if (window.getSelection().getRangeAt(0).endOffset === 0) {
          ins = this.state.selected;
        } else {
          ins = this.state.selected + 1;
          this.setState({
            selected: ins,
            select: true
          });
        }
        WorkActions.newItem(ins, this.props.list);
        break;
      case 8:
        if (window.getSelection().getRangeAt(0).endOffset === 0 && e.target.innerText.length === 0) {
          if (this.state.selected !== 0) {
            this.setState({
              selected: this.state.selected - 1,
              select: "end"
            });
          }
          WorkActions.removeItem(this.state.selected, this.props.list, i.props.item.serial);
          e.preventDefault();
        }
        break;
      case 38:
        last = this.state.selected - 1;
        if (last < 0) {
          last = this.state.list.length - 1;
        }
        this.$items.eq(last).find('.title .input').focus();
        this.setState({
          select: "end"
        });
        break;
      case 40:
        next = this.state.selected + 1;
        if (next === this.state.list.length) {
          next = 0;
        }
        this.$items.eq(next).find('.title .input').focus();
        this.setState({
          select: "end"
        });
    }
    if ((kc === 13) || (kc === 38) || (kc === 40)) {
      return e.preventDefault();
    }
  },
  update: function(i) {
    var item, k, ref1, v;
    item = {};
    ref1 = i.props.item;
    for (k in ref1) {
      v = ref1[k];
      if (i.state[k] !== void 0 && i.state[k] !== i.props.item[k]) {
        item[k] = i.state[k];
      }
    }
    if (Object.keys(item).length > 0) {
      item = _.merge(i.props.item, item);
      return WorkActions.updateItem(item.index, this.props.list, item);
    }
  },
  componentDidMount: function() {
    this.placeholder = $("<div class='item placeholder'><div class='sort'>x</div></div>");
    WorkStore.addChangeListener(this._onChangeStore);
    return this.alias();
  },
  componentDidUpdate: function() {
    var $title, r, s;
    this.alias();
    if (this.state.selected !== void 0 || this.state.select) {
      $title = this.$items.eq(this.state.selected).find('.title .input');
    }
    if (this.state.selected !== void 0 && this.state.select) {
      $title.focus();
    }
    if (this.state.select === "end") {
      r = window.getSelection().getRangeAt(0);
      r.setStart($title[0], 1);
      r.setEnd($title[0], 1);
      s = window.getSelection();
      s.removeAllRanges();
      s.addRange(r);
    }
    if (this.state.select) {
      return this.setState({
        select: false
      });
    }
  },
  render: function() {
    return div({
      className: 'list'
    }, [
      h1({}, this.props.list), div({
        className: 'items',
        onDragOver: this._dragOver,
        onClick: this._click
      }, [
        _.map(this.state.list, (function(_this) {
          return function(item, index) {
            return rece(ItemComponent, {
              item: item,
              index: index,
              _focus: _this._focus,
              _blur: _this._blur,
              _keyDown: _this._keyDown,
              _dragStart: _this._dragStart,
              _dragOver: _this._dragOver,
              _dragEnd: _this._dragEnd
            });
          };
        })(this))
      ])
    ]);
  }
});



},{"../actions/WorkActions.coffee":"/Users/galen/src/urbit/urb/zod/main/pub/work/src/js/actions/WorkActions.coffee","../stores/WorkStore.coffee":"/Users/galen/src/urbit/urb/zod/main/pub/work/src/js/stores/WorkStore.coffee","./ItemComponent.coffee":"/Users/galen/src/urbit/urb/zod/main/pub/work/src/js/components/ItemComponent.coffee"}],"/Users/galen/src/urbit/urb/zod/main/pub/work/src/js/components/WorkComponent.coffee":[function(require,module,exports){
var ListComponent, div, input, rece, recl, ref, textarea;

recl = React.createClass;

rece = React.createElement;

ref = [React.DOM.div, React.DOM.input, React.DOM.textarea], div = ref[0], input = ref[1], textarea = ref[2];

ListComponent = require('./ListComponent.coffee');

module.exports = recl({
  render: function() {
    return div({}, [
      rece(ListComponent, {
        list: 'upcoming'
      })
    ]);
  }
});



},{"./ListComponent.coffee":"/Users/galen/src/urbit/urb/zod/main/pub/work/src/js/components/ListComponent.coffee"}],"/Users/galen/src/urbit/urb/zod/main/pub/work/src/js/dispatcher/Dispatcher.coffee":[function(require,module,exports){
var Dispatcher;

Dispatcher = require('flux').Dispatcher;

module.exports = _.merge(new Dispatcher(), {
  handleServerAction: function(action) {
    return this.dispatch({
      source: 'server',
      action: action
    });
  },
  handleViewAction: function(action) {
    return this.dispatch({
      source: 'view',
      action: action
    });
  }
});



},{"flux":"/Users/galen/src/urbit/urb/zod/main/pub/work/src/js/node_modules/flux/index.js"}],"/Users/galen/src/urbit/urb/zod/main/pub/work/src/js/module.coffee":[function(require,module,exports){
require('./util.coffee');

window.work = {
  Component: require('./components/WorkComponent.coffee'),
  Persistence: require('./persistence/WorkPersistence.coffee'),
  init: function(el) {
    return this.Persistence.listen();
  }
};



},{"./components/WorkComponent.coffee":"/Users/galen/src/urbit/urb/zod/main/pub/work/src/js/components/WorkComponent.coffee","./persistence/WorkPersistence.coffee":"/Users/galen/src/urbit/urb/zod/main/pub/work/src/js/persistence/WorkPersistence.coffee","./util.coffee":"/Users/galen/src/urbit/urb/zod/main/pub/work/src/js/util.coffee"}],"/Users/galen/src/urbit/urb/zod/main/pub/work/src/js/node_modules/flux/index.js":[function(require,module,exports){
/**
 * Copyright (c) 2014, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

module.exports.Dispatcher = require('./lib/Dispatcher')

},{"./lib/Dispatcher":"/Users/galen/src/urbit/urb/zod/main/pub/work/src/js/node_modules/flux/lib/Dispatcher.js"}],"/Users/galen/src/urbit/urb/zod/main/pub/work/src/js/node_modules/flux/lib/Dispatcher.js":[function(require,module,exports){
/*
 * Copyright (c) 2014, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 *
 * @providesModule Dispatcher
 * @typechecks
 */

"use strict";

var invariant = require('./invariant');

var _lastID = 1;
var _prefix = 'ID_';

/**
 * Dispatcher is used to broadcast payloads to registered callbacks. This is
 * different from generic pub-sub systems in two ways:
 *
 *   1) Callbacks are not subscribed to particular events. Every payload is
 *      dispatched to every registered callback.
 *   2) Callbacks can be deferred in whole or part until other callbacks have
 *      been executed.
 *
 * For example, consider this hypothetical flight destination form, which
 * selects a default city when a country is selected:
 *
 *   var flightDispatcher = new Dispatcher();
 *
 *   // Keeps track of which country is selected
 *   var CountryStore = {country: null};
 *
 *   // Keeps track of which city is selected
 *   var CityStore = {city: null};
 *
 *   // Keeps track of the base flight price of the selected city
 *   var FlightPriceStore = {price: null}
 *
 * When a user changes the selected city, we dispatch the payload:
 *
 *   flightDispatcher.dispatch({
 *     actionType: 'city-update',
 *     selectedCity: 'paris'
 *   });
 *
 * This payload is digested by `CityStore`:
 *
 *   flightDispatcher.register(function(payload) {
 *     if (payload.actionType === 'city-update') {
 *       CityStore.city = payload.selectedCity;
 *     }
 *   });
 *
 * When the user selects a country, we dispatch the payload:
 *
 *   flightDispatcher.dispatch({
 *     actionType: 'country-update',
 *     selectedCountry: 'australia'
 *   });
 *
 * This payload is digested by both stores:
 *
 *    CountryStore.dispatchToken = flightDispatcher.register(function(payload) {
 *     if (payload.actionType === 'country-update') {
 *       CountryStore.country = payload.selectedCountry;
 *     }
 *   });
 *
 * When the callback to update `CountryStore` is registered, we save a reference
 * to the returned token. Using this token with `waitFor()`, we can guarantee
 * that `CountryStore` is updated before the callback that updates `CityStore`
 * needs to query its data.
 *
 *   CityStore.dispatchToken = flightDispatcher.register(function(payload) {
 *     if (payload.actionType === 'country-update') {
 *       // `CountryStore.country` may not be updated.
 *       flightDispatcher.waitFor([CountryStore.dispatchToken]);
 *       // `CountryStore.country` is now guaranteed to be updated.
 *
 *       // Select the default city for the new country
 *       CityStore.city = getDefaultCityForCountry(CountryStore.country);
 *     }
 *   });
 *
 * The usage of `waitFor()` can be chained, for example:
 *
 *   FlightPriceStore.dispatchToken =
 *     flightDispatcher.register(function(payload) {
 *       switch (payload.actionType) {
 *         case 'country-update':
 *           flightDispatcher.waitFor([CityStore.dispatchToken]);
 *           FlightPriceStore.price =
 *             getFlightPriceStore(CountryStore.country, CityStore.city);
 *           break;
 *
 *         case 'city-update':
 *           FlightPriceStore.price =
 *             FlightPriceStore(CountryStore.country, CityStore.city);
 *           break;
 *     }
 *   });
 *
 * The `country-update` payload will be guaranteed to invoke the stores'
 * registered callbacks in order: `CountryStore`, `CityStore`, then
 * `FlightPriceStore`.
 */

  function Dispatcher() {
    this.$Dispatcher_callbacks = {};
    this.$Dispatcher_isPending = {};
    this.$Dispatcher_isHandled = {};
    this.$Dispatcher_isDispatching = false;
    this.$Dispatcher_pendingPayload = null;
  }

  /**
   * Registers a callback to be invoked with every dispatched payload. Returns
   * a token that can be used with `waitFor()`.
   *
   * @param {function} callback
   * @return {string}
   */
  Dispatcher.prototype.register=function(callback) {
    var id = _prefix + _lastID++;
    this.$Dispatcher_callbacks[id] = callback;
    return id;
  };

  /**
   * Removes a callback based on its token.
   *
   * @param {string} id
   */
  Dispatcher.prototype.unregister=function(id) {
    invariant(
      this.$Dispatcher_callbacks[id],
      'Dispatcher.unregister(...): `%s` does not map to a registered callback.',
      id
    );
    delete this.$Dispatcher_callbacks[id];
  };

  /**
   * Waits for the callbacks specified to be invoked before continuing execution
   * of the current callback. This method should only be used by a callback in
   * response to a dispatched payload.
   *
   * @param {array<string>} ids
   */
  Dispatcher.prototype.waitFor=function(ids) {
    invariant(
      this.$Dispatcher_isDispatching,
      'Dispatcher.waitFor(...): Must be invoked while dispatching.'
    );
    for (var ii = 0; ii < ids.length; ii++) {
      var id = ids[ii];
      if (this.$Dispatcher_isPending[id]) {
        invariant(
          this.$Dispatcher_isHandled[id],
          'Dispatcher.waitFor(...): Circular dependency detected while ' +
          'waiting for `%s`.',
          id
        );
        continue;
      }
      invariant(
        this.$Dispatcher_callbacks[id],
        'Dispatcher.waitFor(...): `%s` does not map to a registered callback.',
        id
      );
      this.$Dispatcher_invokeCallback(id);
    }
  };

  /**
   * Dispatches a payload to all registered callbacks.
   *
   * @param {object} payload
   */
  Dispatcher.prototype.dispatch=function(payload) {
    invariant(
      !this.$Dispatcher_isDispatching,
      'Dispatch.dispatch(...): Cannot dispatch in the middle of a dispatch.'
    );
    this.$Dispatcher_startDispatching(payload);
    try {
      for (var id in this.$Dispatcher_callbacks) {
        if (this.$Dispatcher_isPending[id]) {
          continue;
        }
        this.$Dispatcher_invokeCallback(id);
      }
    } finally {
      this.$Dispatcher_stopDispatching();
    }
  };

  /**
   * Is this Dispatcher currently dispatching.
   *
   * @return {boolean}
   */
  Dispatcher.prototype.isDispatching=function() {
    return this.$Dispatcher_isDispatching;
  };

  /**
   * Call the callback stored with the given id. Also do some internal
   * bookkeeping.
   *
   * @param {string} id
   * @internal
   */
  Dispatcher.prototype.$Dispatcher_invokeCallback=function(id) {
    this.$Dispatcher_isPending[id] = true;
    this.$Dispatcher_callbacks[id](this.$Dispatcher_pendingPayload);
    this.$Dispatcher_isHandled[id] = true;
  };

  /**
   * Set up bookkeeping needed when dispatching.
   *
   * @param {object} payload
   * @internal
   */
  Dispatcher.prototype.$Dispatcher_startDispatching=function(payload) {
    for (var id in this.$Dispatcher_callbacks) {
      this.$Dispatcher_isPending[id] = false;
      this.$Dispatcher_isHandled[id] = false;
    }
    this.$Dispatcher_pendingPayload = payload;
    this.$Dispatcher_isDispatching = true;
  };

  /**
   * Clear bookkeeping used for dispatching.
   *
   * @internal
   */
  Dispatcher.prototype.$Dispatcher_stopDispatching=function() {
    this.$Dispatcher_pendingPayload = null;
    this.$Dispatcher_isDispatching = false;
  };


module.exports = Dispatcher;

},{"./invariant":"/Users/galen/src/urbit/urb/zod/main/pub/work/src/js/node_modules/flux/lib/invariant.js"}],"/Users/galen/src/urbit/urb/zod/main/pub/work/src/js/node_modules/flux/lib/invariant.js":[function(require,module,exports){
/**
 * Copyright (c) 2014, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 *
 * @providesModule invariant
 */

"use strict";

/**
 * Use invariant() to assert state which your program assumes to be true.
 *
 * Provide sprintf-style format (only %s is supported) and arguments
 * to provide information about what broke and what you were
 * expecting.
 *
 * The invariant message will be stripped in production, but the invariant
 * will remain to ensure logic does not differ in production.
 */

var invariant = function(condition, format, a, b, c, d, e, f) {
  if (false) {
    if (format === undefined) {
      throw new Error('invariant requires an error message argument');
    }
  }

  if (!condition) {
    var error;
    if (format === undefined) {
      error = new Error(
        'Minified exception occurred; use the non-minified dev environment ' +
        'for the full error message and additional helpful warnings.'
      );
    } else {
      var args = [a, b, c, d, e, f];
      var argIndex = 0;
      error = new Error(
        'Invariant Violation: ' +
        format.replace(/%s/g, function() { return args[argIndex++]; })
      );
    }

    error.framesToPop = 1; // we don't care about invariant's own frame
    throw error;
  }
};

module.exports = invariant;

},{}],"/Users/galen/src/urbit/urb/zod/main/pub/work/src/js/node_modules/object-assign/index.js":[function(require,module,exports){
'use strict';

function ToObject(val) {
	if (val == null) {
		throw new TypeError('Object.assign cannot be called with null or undefined');
	}

	return Object(val);
}

module.exports = Object.assign || function (target, source) {
	var pendingException;
	var from;
	var keys;
	var to = ToObject(target);

	for (var s = 1; s < arguments.length; s++) {
		from = arguments[s];
		keys = Object.keys(Object(from));

		for (var i = 0; i < keys.length; i++) {
			try {
				to[keys[i]] = from[keys[i]];
			} catch (err) {
				if (pendingException === undefined) {
					pendingException = err;
				}
			}
		}
	}

	if (pendingException) {
		throw pendingException;
	}

	return to;
};

},{}],"/Users/galen/src/urbit/urb/zod/main/pub/work/src/js/persistence/WorkPersistence.coffee":[function(require,module,exports){
var WorkActions;

WorkActions = require('../actions/WorkActions.coffee');

module.exports = {
  listen: function() {
    return window.urb.subscribe({
      appl: 'work',
      path: '/r'
    }, function(err, res) {
      var ref;
      console.log('sub');
      console.log(arguments);
      if (!err && !((ref = res.data) != null ? ref.ok : void 0)) {
        return WorkActions.loadItems(res.data);
      }
    });
  },
  createItem: function(sort, serial, title) {
    return window.urb.send({
      appl: 'work',
      mark: 'work-command',
      data: {
        create: {
          sort: Number(sort),
          task: {
            serial: serial,
            title: title
          }
        }
      }
    }, function(err, res) {
      console.log('sent');
      return console.log(arguments);
    });
  },
  updateItem: function(sort, serial, title) {
    return window.urb.send({
      appl: 'work',
      mark: 'work-command',
      data: {
        update: {
          sort: Number(sort),
          task: {
            serial: serial,
            title: title
          }
        }
      }
    }, function(err, res) {
      console.log('sent');
      return console.log(arguments);
    });
  },
  removeItem: function(serial) {
    return window.urb.send({
      appl: 'work',
      mark: 'work-command',
      data: {
        "delete": serial
      }
    });
  }
};



},{"../actions/WorkActions.coffee":"/Users/galen/src/urbit/urb/zod/main/pub/work/src/js/actions/WorkActions.coffee"}],"/Users/galen/src/urbit/urb/zod/main/pub/work/src/js/stores/WorkStore.coffee":[function(require,module,exports){
var Dispatcher, EventEmitter, WorkStore, _following, _incoming, _upcoming, assign, lists;

EventEmitter = require('events').EventEmitter;

assign = require('object-assign');

Dispatcher = require('../dispatcher/Dispatcher.coffee');

_upcoming = [];

_following = [];

_incoming = [];

lists = {
  'upcoming': _upcoming,
  'following': _following,
  'incoming': _incoming
};

WorkStore = assign({}, EventEmitter.prototype, {
  emitChange: function() {
    return this.emit('change');
  },
  addChangeListener: function(cb) {
    return this.on('change', cb);
  },
  removeChangeListener: function(cb) {
    return this.removeListener("change", cb);
  },
  getList: function(key) {
    return lists[key];
  },
  getItem: function(serial, index) {
    var item;
    item = {
      serial: serial,
      index: index,
      title: ' ',
      modified: new Date(),
      created: new Date(),
      due: null,
      comments: [],
      tags: [],
      attn: null,
      owner: "~talsur-todres"
    };
    return item;
  },
  newItem: function(arg) {
    var index, list, serial;
    index = arg.index, list = arg.list, serial = arg.serial;
    list = lists[list];
    return list.splice(index, 0, this.getItem(serial, index));
  },
  updateItem: function(arg) {
    var _item, index, item, list;
    index = arg.index, list = arg.list, item = arg.item;
    list = lists[list];
    _item = _.find(list, function(_item) {
      return _item.serial === item.serial;
    });
    list.splice(list.indexOf(_item), 1);
    return list.splice(index, 0, _item);
  },
  removeItem: function(arg) {
    var index, list;
    index = arg.index, list = arg.list;
    list = lists[list];
    return list.splice(index, 1);
  },
  loadItems: function(arg) {
    var i, items, k, list;
    list = arg.list, items = arg.items;
    for (k in items) {
      i = items[k];
      items[k] = _.merge(this.getItem(i.serial, k), i);
    }
    return lists[list] = items;
  }
});

WorkStore.setMaxListeners(100);

WorkStore.dispatchToken = Dispatcher.register(function(p) {
  var a;
  a = p.action;
  if (WorkStore[a.type]) {
    WorkStore[a.type](a);
    return WorkStore.emitChange();
  }
});

module.exports = WorkStore;



},{"../dispatcher/Dispatcher.coffee":"/Users/galen/src/urbit/urb/zod/main/pub/work/src/js/dispatcher/Dispatcher.coffee","events":"/usr/local/lib/node_modules/watchify/node_modules/browserify/node_modules/events/events.js","object-assign":"/Users/galen/src/urbit/urb/zod/main/pub/work/src/js/node_modules/object-assign/index.js"}],"/Users/galen/src/urbit/urb/zod/main/pub/work/src/js/util.coffee":[function(require,module,exports){
if (!window.util) {
  window.util = {};
}

_.merge(window.util, {
  uuid32: function() {
    var _str, i, j, str;
    str = "0v";
    str += Math.ceil(Math.random() * 8) + ".";
    for (i = j = 0; j <= 5; i = ++j) {
      _str = Math.ceil(Math.random() * 10000000).toString(32);
      _str = ("00000" + _str).substr(-5, 5);
      str += _str + ".";
    }
    return str.slice(0, -1);
  }
});



},{}],"/usr/local/lib/node_modules/watchify/node_modules/browserify/node_modules/events/events.js":[function(require,module,exports){
// Copyright Joyent, Inc. and other Node contributors.
//
// Permission is hereby granted, free of charge, to any person obtaining a
// copy of this software and associated documentation files (the
// "Software"), to deal in the Software without restriction, including
// without limitation the rights to use, copy, modify, merge, publish,
// distribute, sublicense, and/or sell copies of the Software, and to permit
// persons to whom the Software is furnished to do so, subject to the
// following conditions:
//
// The above copyright notice and this permission notice shall be included
// in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
// OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN
// NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
// DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
// OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
// USE OR OTHER DEALINGS IN THE SOFTWARE.

function EventEmitter() {
  this._events = this._events || {};
  this._maxListeners = this._maxListeners || undefined;
}
module.exports = EventEmitter;

// Backwards-compat with node 0.10.x
EventEmitter.EventEmitter = EventEmitter;

EventEmitter.prototype._events = undefined;
EventEmitter.prototype._maxListeners = undefined;

// By default EventEmitters will print a warning if more than 10 listeners are
// added to it. This is a useful default which helps finding memory leaks.
EventEmitter.defaultMaxListeners = 10;

// Obviously not all Emitters should be limited to 10. This function allows
// that to be increased. Set to zero for unlimited.
EventEmitter.prototype.setMaxListeners = function(n) {
  if (!isNumber(n) || n < 0 || isNaN(n))
    throw TypeError('n must be a positive number');
  this._maxListeners = n;
  return this;
};

EventEmitter.prototype.emit = function(type) {
  var er, handler, len, args, i, listeners;

  if (!this._events)
    this._events = {};

  // If there is no 'error' event listener then throw.
  if (type === 'error') {
    if (!this._events.error ||
        (isObject(this._events.error) && !this._events.error.length)) {
      er = arguments[1];
      if (er instanceof Error) {
        throw er; // Unhandled 'error' event
      } else {
        throw TypeError('Uncaught, unspecified "error" event.');
      }
      return false;
    }
  }

  handler = this._events[type];

  if (isUndefined(handler))
    return false;

  if (isFunction(handler)) {
    switch (arguments.length) {
      // fast cases
      case 1:
        handler.call(this);
        break;
      case 2:
        handler.call(this, arguments[1]);
        break;
      case 3:
        handler.call(this, arguments[1], arguments[2]);
        break;
      // slower
      default:
        len = arguments.length;
        args = new Array(len - 1);
        for (i = 1; i < len; i++)
          args[i - 1] = arguments[i];
        handler.apply(this, args);
    }
  } else if (isObject(handler)) {
    len = arguments.length;
    args = new Array(len - 1);
    for (i = 1; i < len; i++)
      args[i - 1] = arguments[i];

    listeners = handler.slice();
    len = listeners.length;
    for (i = 0; i < len; i++)
      listeners[i].apply(this, args);
  }

  return true;
};

EventEmitter.prototype.addListener = function(type, listener) {
  var m;

  if (!isFunction(listener))
    throw TypeError('listener must be a function');

  if (!this._events)
    this._events = {};

  // To avoid recursion in the case that type === "newListener"! Before
  // adding it to the listeners, first emit "newListener".
  if (this._events.newListener)
    this.emit('newListener', type,
              isFunction(listener.listener) ?
              listener.listener : listener);

  if (!this._events[type])
    // Optimize the case of one listener. Don't need the extra array object.
    this._events[type] = listener;
  else if (isObject(this._events[type]))
    // If we've already got an array, just append.
    this._events[type].push(listener);
  else
    // Adding the second element, need to change to array.
    this._events[type] = [this._events[type], listener];

  // Check for listener leak
  if (isObject(this._events[type]) && !this._events[type].warned) {
    var m;
    if (!isUndefined(this._maxListeners)) {
      m = this._maxListeners;
    } else {
      m = EventEmitter.defaultMaxListeners;
    }

    if (m && m > 0 && this._events[type].length > m) {
      this._events[type].warned = true;
      console.error('(node) warning: possible EventEmitter memory ' +
                    'leak detected. %d listeners added. ' +
                    'Use emitter.setMaxListeners() to increase limit.',
                    this._events[type].length);
      if (typeof console.trace === 'function') {
        // not supported in IE 10
        console.trace();
      }
    }
  }

  return this;
};

EventEmitter.prototype.on = EventEmitter.prototype.addListener;

EventEmitter.prototype.once = function(type, listener) {
  if (!isFunction(listener))
    throw TypeError('listener must be a function');

  var fired = false;

  function g() {
    this.removeListener(type, g);

    if (!fired) {
      fired = true;
      listener.apply(this, arguments);
    }
  }

  g.listener = listener;
  this.on(type, g);

  return this;
};

// emits a 'removeListener' event iff the listener was removed
EventEmitter.prototype.removeListener = function(type, listener) {
  var list, position, length, i;

  if (!isFunction(listener))
    throw TypeError('listener must be a function');

  if (!this._events || !this._events[type])
    return this;

  list = this._events[type];
  length = list.length;
  position = -1;

  if (list === listener ||
      (isFunction(list.listener) && list.listener === listener)) {
    delete this._events[type];
    if (this._events.removeListener)
      this.emit('removeListener', type, listener);

  } else if (isObject(list)) {
    for (i = length; i-- > 0;) {
      if (list[i] === listener ||
          (list[i].listener && list[i].listener === listener)) {
        position = i;
        break;
      }
    }

    if (position < 0)
      return this;

    if (list.length === 1) {
      list.length = 0;
      delete this._events[type];
    } else {
      list.splice(position, 1);
    }

    if (this._events.removeListener)
      this.emit('removeListener', type, listener);
  }

  return this;
};

EventEmitter.prototype.removeAllListeners = function(type) {
  var key, listeners;

  if (!this._events)
    return this;

  // not listening for removeListener, no need to emit
  if (!this._events.removeListener) {
    if (arguments.length === 0)
      this._events = {};
    else if (this._events[type])
      delete this._events[type];
    return this;
  }

  // emit removeListener for all listeners on all events
  if (arguments.length === 0) {
    for (key in this._events) {
      if (key === 'removeListener') continue;
      this.removeAllListeners(key);
    }
    this.removeAllListeners('removeListener');
    this._events = {};
    return this;
  }

  listeners = this._events[type];

  if (isFunction(listeners)) {
    this.removeListener(type, listeners);
  } else {
    // LIFO order
    while (listeners.length)
      this.removeListener(type, listeners[listeners.length - 1]);
  }
  delete this._events[type];

  return this;
};

EventEmitter.prototype.listeners = function(type) {
  var ret;
  if (!this._events || !this._events[type])
    ret = [];
  else if (isFunction(this._events[type]))
    ret = [this._events[type]];
  else
    ret = this._events[type].slice();
  return ret;
};

EventEmitter.listenerCount = function(emitter, type) {
  var ret;
  if (!emitter._events || !emitter._events[type])
    ret = 0;
  else if (isFunction(emitter._events[type]))
    ret = 1;
  else
    ret = emitter._events[type].length;
  return ret;
};

function isFunction(arg) {
  return typeof arg === 'function';
}

function isNumber(arg) {
  return typeof arg === 'number';
}

function isObject(arg) {
  return typeof arg === 'object' && arg !== null;
}

function isUndefined(arg) {
  return arg === void 0;
}

},{}]},{},["/Users/galen/src/urbit/urb/zod/main/pub/work/src/js/module.coffee"]);
