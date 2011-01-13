{Types} = require '../lib/index'

#############################################
test 'is sealed', ->
  ok Object.isSealed Types

#############################################
test 'string', ->
  ok Types.isString 'event'
  ok not Types.isString false  
  ok not Types.isString null

#############################################
test 'boolean', ->
  ok Types.isBoolean true
  ok not Types.isBoolean 'true'
  ok not Types.isBoolean null

#############################################
test 'number', ->
  ok Types.isNumber 123
  ok not Types.isNumber '123'
  ok not Types.isNumber Number.NaN
  ok not Types.isNumber 1.7976931348623157E+10308
  ok not Types.isNumber -1.7976931348623157E+10308
  ok not Types.isNumber null

#############################################
test 'primitive', ->
  ok Types.isPrimitive 1
  ok Types.isPrimitive "1"
  ok Types.isPrimitive true
  ok not Types.isPrimitive {}
  ok not Types.isPrimitive null

#############################################
test 'date', ->
  ok Types.isDate new Date()
  ok not Types.isDate 'today'
  ok not Types.isDate null

#############################################
test 'object', ->
  ok Types.isObject {}
  ok not Types.isObject '{}'
  ok not Types.isObject null

#############################################
test 'function', ->
  ok Types.isFunction ->
  ok Types.isFunction toString
  ok not Types.isFunction ''

#############################################
test 'array', ->
  ok Types.isArray []
  ok not Types.isArray ''
  ok not Types.isArray null