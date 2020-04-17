# Condition

[![Build Status](https://travis-ci.org/olekscode/Condition.svg?branch=master)](https://travis-ci.org/olekscode/Condition)
[![Build status](https://ci.appveyor.com/api/projects/status/kyqg5lvs7rudxxps?svg=true)](https://ci.appveyor.com/project/olekscode/condition)
[![Coverage Status](https://coveralls.io/repos/github/olekscode/Condition/badge.svg?branch=master)](https://coveralls.io/github/olekscode/Condition?branch=master)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/olekscode/Condition/master/LICENSE)

Reification of a one-argument conditional block. Supports operations for combining multiple conditions 

## How to install it?

To install `Condition`, go to the Playground (Ctrl+OW) in your [Pharo](https://pharo.org/) image and execute the following Metacello script (select it and press Do-it button or Ctrl+D):

```Smalltalk
Metacello new
  baseline: 'Condition';
  repository: 'github://olekscode/Condition/src';
  load.
```

## How to depend on it?

If you want to add a dependency on `Condition` to your project, include the following lines into your baseline method:

```Smalltalk
spec
  baseline: 'Condition'
  with: [ spec repository: 'github://olekscode/Condition/src' ].
```

If you are new to baselines and Metacello, check out the [Baselines](https://github.com/pharo-open-documentation/pharo-wiki/blob/master/General/Baselines.md) tutorial on Pharo Wiki.

## How to use it?
