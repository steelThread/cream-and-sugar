#
#  types.coffee: verify types
#
#  (C) 2011 Sean McDaniel
#  MIT LICENCE
#
class Types
  constructor: ->
  
  isString:   (val) -> typeof val is 'string'
  isBoolean:  (val) -> typeof val is 'boolean'
  isNumber:   (val) -> typeof val is 'number' and isFinite val
  isPrimitive:(val) -> @isString(val) or @isBoolean(val) or @isNumber(val)
  isDate:     (val) -> @assert val, '[object Date]'
  isObject:   (val) -> @assert val, '[object Object]'
  isFunction: (val) -> @assert val, '[object Function]'
  isArray:    (val) -> @assert val, '[object Array]'
  
  assert: (val, expected) -> expected is toString.apply val

exports.Types = Object.seal(new Types)