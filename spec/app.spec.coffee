console.log(window.require.list())

Parent = require('app/parent')
describe 'Parent', ->
  it 'should be a prototype', ->
    expect(Parent).to.be.a.function

  describe 'Actions', ->
    it 'can walk', ->
      expect(Parent.prototype.talk).to.be.a.function

    it 'can talk', ->
      expect(Child.prototype.talk).to.be.a.function

Child = require('app/child')
describe 'Child', ->
  it 'should be a prototype', ->
    expect(Child).to.be.a.function

  describe 'Actions', ->
    it 'can walk, using super', ->
      expect(Child.prototype.walk).to.be.a.function

    it 'can talk, inherited from the parent', ->
      expect(Child.prototype.talk).to.be.a.function

    it 'can run on its own', ->
      expect(Child.prototype.run).to.be.a.function

App = require('app/app')
describe 'App', ->
  it 'should create an app property in the window', ->
    expect(window).to.have.property('app')
    expect(window.app).to.be.an('object')

  it 'should have a Child instance', ->
    expect(app).to.have.property('c')
    expect(app.c).to.be.an('object')
