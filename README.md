# Condition

[![Build Status](https://travis-ci.org/olekscode/Condition.svg?branch=master)](https://travis-ci.org/olekscode/Condition)
[![Build status](https://ci.appveyor.com/api/projects/status/kyqg5lvs7rudxxps?svg=true)](https://ci.appveyor.com/project/olekscode/condition)
[![Coverage Status](https://coveralls.io/repos/github/olekscode/Condition/badge.svg?branch=master)](https://coveralls.io/github/olekscode/Condition?branch=master)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/olekscode/Condition/master/LICENSE)

Reification of a one-argument conditional block. Supports operations for combining multiple conditions, which allows us to decompose complex logical queries into meaningful parts that can be reused.

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

Conditions can be defined using block closures:

```Smalltalk
isPositive := [ :x | x > 0 ] asCondition.
isOdd := [ :x | x % 2 = 1 ] asCondition.

isTestClass := [ :aClass | aClass inheritsFrom: TestCase ] asCondition.
isEmptyClass := [ :aClass | aClass methods isEmpty ] asCondition.
```
Conditions can be evaluated as normal blocks. They are expected to return boolean values:

```Smalltalk
isOdd value: 2. "false"
isTestClass value: ConditionTest. "true"
```

Conditions can be manipulated and combined using all basic operations of boolean algebra: AND, OR, NOT, XOR, IMPLIES, and EQUALS:

```Smalltalk
isPositiveOrOdd := isPositive or: isOdd.
isEmptyTestClass := isTestClass and: isEmptyClass.

alwaysTrue := (isOdd not or: isPositive) logicalEquals: (isOdd implies: isPositive).
```

Any combination of conditions is also a condition:

```Smalltalk
isEmptyTestClass value: ConditionTest. "false"
isPositiveOrOdd value: -1. "true".
alwaysTrue value: (Random new next). "true"
```
