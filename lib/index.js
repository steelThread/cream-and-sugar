exports.version = '0.0.1';

//
//  Read in all the coffee scripts and add to the exports
//  everything that is exported
//
require('fs').readdirSync(__dirname).forEach(function(filename) {
  if (/\.coffee$/.test(filename)) {
    var name = filename.substr(0, filename.lastIndexOf('.'));
    var module = require('./' + name);
    Object.keys(module).forEach(function(property) {
	  Object.defineProperty(exports, property, {
		get: function() { return module[property]; }
	  });
    });
  }
});