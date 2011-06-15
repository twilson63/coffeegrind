helpers = require('../../app/server/helpers')

context = {}
helpers.extends(context)

describe 'helpers', ->
  describe 'util', ->
    it 'attrs', ->
      result = context.util.attrs foo: 'bar', 'bar': 'foo'
      expect(result).toEqual(" foo='bar' bar='foo'")
    it 'tag with attributes', ->
      result = context.util.tag 'foo', [awesome: 'sauce', -> 'bar']
      expect(result).toEqual("<foo awesome='sauce'>bar</foo>")
    it 'tag with string', ->
      result = context.util.tag 'foo', ['bar']
      expect(result).toEqual("<foo>bar</foo>")

  describe 'textField', ->
    it 'should accept id, name, and placeholder', ->
      result = context.textField id: 'user', name: 'user', placeholder: 'enter user'
      expect(result).toEqual("<input id='user' name='user' placeholder='enter user' type='text' />")
    it 'should accept id', ->
      result = context.textField id: 'user'
      expect(result).toEqual("<input id='user' type='text' />")
    it 'should accept name', ->
      result = context.textField name: 'user'
      expect(result).toEqual("<input name='user' type='text' />")
  describe 'passwordField', ->
    it 'should be valid', ->
      result = context.passwordField id: 'password', name: 'password'
      expect(result).toEqual("<input id='password' name='password' type='password' />")
  describe 'form', ->
    it 'should accept action and method attributes', ->
      result = context.form action: 'foo', method: 'bar'
      expect(result).toEqual("<form action='foo' method='bar'></form>")

