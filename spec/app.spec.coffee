console.log(window.require.list())

Parent = require('app/parent')
describe 'Parent', ->
  it 'should be a prototype', ->
    expect(Parent).to.be.a.function

Child = require('app/child')
describe 'Child', ->
  it 'should be a prototype', ->
    expect(Child).to.be.a.function

App = require('app/app')
describe 'App', ->
  it 'should create an app property in the window', ->
    expect(window).to.have.property('app')
    expect(window.app).to.be.an('object')

  it 'should have a Child instance', ->
    expect(app).to.have.property('c')
    expect(app.c).to.be.an('object')
