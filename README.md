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
A really simple browserify project exists in `app/` and a basic test suite in
`spec`

## Props
Wouldn't be possible without [@kylewelsby](https://github.com/kylewelsby)'s fork of karma-coverage.
It fixes the problem of Iblik (~Istanbul) using coffeescript-redux instead of
a real CoffeeScript compiler.

----

[coverallsBadge]: https://coveralls.io/repos/davidosomething/karmatest/badge.png
[coverallsLink]:  https://coveralls.io/r/davidosomething/karmatest
[davidBadge]:     https://david-dm.org/davidosomething/karmatest.png
[packageJson]:    https://github.com/davidosomething/karmatest/blob/master/package.json
[travisLink]:     https://travis-ci.org/davidosomething/karmatest
[travisBadge]:    http://travis-ci.org/davidosomething/karmatest.png
