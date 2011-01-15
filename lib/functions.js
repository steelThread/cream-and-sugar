(function() {
  var Types, appendArgs;
  Types = require('./types').Types;
  if (Function.prototype.createCallback == null) {
    Function.prototype.createCallback = function() {
      var args, me;
      me = this;
      args = arguments;
      return function() {
        return me.apply(global, args);
      };
    };
  }
  appendArgs = function(arguments, args) {
    return Array.prototype.slice.call(arguments, 0).concat(args);
  };
  if (Function.prototype.createDelegate == null) {
    Function.prototype.createDelegate = function(scope, args, append) {
      var me;
      if (scope == null) {
        scope = global;
      }
      if (args == null) {
        args = [];
      }
      if (append == null) {
        append = false;
      }
      me = this;
      return function() {
        return me.apply(scope, append ? appendArgs(arguments, args) : args);
      };
    };
  }
  if (Function.prototype.createInterceptor == null) {
    Function.prototype.createInterceptor = function(fn, scope) {
      var me;
      if (scope == null) {
        scope = global;
      }
      me = this;
      if (Types.isFunction(fn)) {
        return function() {
          if (fn.apply(scope, arguments) !== false) {
            return me.apply(typeof this != "undefined" && this !== null ? this : global, arguments);
          }
        };
      } else {
        return me;
      }
    };
  }
  if (Function.prototype.createSequence == null) {
    Function.prototype.createSequence = function(fn, scope) {
      var me;
      if (scope == null) {
        scope = global;
      }
      me = this;
      if (!Types.isFunction(fn)) {
        return me;
      } else {
        return function() {
          var ret;
          ret = me.apply(typeof this != "undefined" && this !== null ? this : global, arguments);
          fn.apply(scope, arguments);
          return ret;
        };
      }
    };
  }
}).call(this);
