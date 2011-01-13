{Types} = require '../lib/types'

#############################################
test 'string', ->
  ok Types.string 'event'
  ok not Types.string false  
  ok not Types.string null

#############################################
test 'boolean', ->
  ok Types.boolean true
  ok not Types.boolean 'true'
  ok not Types.boolean null

#############################################
test 'number', ->
  ok Types.number 123
  ok not Types.number '123'
  ok not Types.number Number.NaN
  ok not Types.number 1.7976931348623157E+10308
  ok not Types.number -1.7976931348623157E+10308
  ok not Types.number null

#############################################
test 'primitive', ->
  ok Types.primitive 1
  ok Types.primitive "1"
  ok Types.primitive true
  ok not Types.primitive {}
  ok not Types.primitive null

#############################################
test 'date', ->
  ok Types.date new Date()
  ok not Types.date 'today'
  ok not Types.date null

#############################################
test 'object', ->
  ok Types.object {}
  ok not Types.object '{}'
  ok not Types.object null

#############################################
test 'function', ->
  ok Types.function ->
  ok Types.function toString
  ok not Types.function ''

#############################################
test 'array', ->
  ok Types.array []
  ok not Types.array ''
  ok not Types.array null