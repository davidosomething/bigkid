# BigKid

[![Travis CI build status][travisBadge]][travisLink]
[![David dependency status][davidBadge]][packageJson]
[![Coverage Status][coverallsBadge]][coverallsLink]

> Tooling starter for projects using CoffeeScript, Browserify/CommonJS, Karma,
> Istanbul, Mocha, and more.

## What is this?
If you use the above mentioned stack, this will get you started with
compilation, testing, and code coverage.

## What does it include?
Look at the `package.json` file, `Gruntfile.coffee`, and `karma.conf.coffee`
All of those dependencies are set up and working for you.

Also CommonJS modules are fully supported by the app and tests. Add external
libraries and shims into `config/browserify-shim.coffee`

A really simple browserify project exists in `app/` and a basic test suite in
`spec`

## How do I use it?
Tear it apart and pick at what you need.

`grunt build` will compile the project
`grunt test` will run the test runner (karma)

## Props
Wouldn't be possible without [@kylewelsby](https://github.com/kylewelsby)'s fork of karma-coverage.
It fixes the problem of Iblik (~Istanbul) using coffeescript-redux instead of
a real CoffeeScript compiler.

----

[coverallsBadge]: https://img.shields.io/coveralls/davidosomething/bigkid.svg
[coverallsLink]:  https://coveralls.io/r/davidosomething/bigkid?branch=master
[davidBadge]:     https://david-dm.org/davidosomething/bigkid.png
[packageJson]:    https://github.com/davidosomething/bigkid/blob/master/package.json
[travisLink]:     https://travis-ci.org/davidosomething/bigkid
[travisBadge]:    http://travis-ci.org/davidosomething/bigkid.png
