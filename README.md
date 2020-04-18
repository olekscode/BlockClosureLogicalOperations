# Logical Operations on Block Closures

[![Build Status](https://travis-ci.org/olekscode/Condition.svg?branch=master)](https://travis-ci.org/olekscode/Condition)
[![Build status](https://ci.appveyor.com/api/projects/status/kyqg5lvs7rudxxps?svg=true)](https://ci.appveyor.com/project/olekscode/condition)
[![Coverage Status](https://coveralls.io/repos/github/olekscode/Condition/badge.svg?branch=master)](https://coveralls.io/github/olekscode/Condition?branch=master)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/olekscode/Condition/master/LICENSE)

This repository contains a simple extension of Pharo's `BlockClosure` with basic operations of Boolean algebra. It allows us to decompose complex logical queries into meaningful parts that can be reused.

## How to install it?

To install `BlockClosureLogicalOperations`, go to the Playground (Ctrl+OW) in your [Pharo](https://pharo.org/) image and execute the following Metacello script (select it and press Do-it button or Ctrl+D):

```Smalltalk
Metacello new
  baseline: 'BlockClosureLogicalOperations';
  repository: 'github://olekscode/BlockClosureLogicalOperations/src';
  load.
```

## How to depend on it?

If you want to add a dependency on `BlockClosureLogicalOperations` to your project, include the following lines into your baseline method:

```Smalltalk
spec
  baseline: 'BlockClosureLogicalOperations'
  with: [ spec repository: 'github://olekscode/BlockClosureLogicalOperations/src' ].
```

If you are new to baselines and Metacello, check out the [Baselines](https://github.com/pharo-open-documentation/pharo-wiki/blob/master/General/Baselines.md) tutorial on Pharo Wiki.

## How to use it?

Let's define several logical blocks closures:

```Smalltalk
isPositive := [ :x | x > 0 ].
isOdd := [ :x | x % 2 = 1 ].

isTestClass := [ :aClass | aClass inheritsFrom: TestCase ] asCondition.
isEmptyClass := [ :aClass | aClass methods isEmpty ] asCondition.
```
They evaluate to Boolean values:

```Smalltalk
isOdd value: 2. "false"
isTestClass value: ConditionTest. "true"
```

We can manipulat and combine those blocks using all basic operations of boolean algebra: AND, OR, NOT, XOR, IMPLIES, and EQUALS:

```Smalltalk
isPositiveOrOdd := isPositive or: isOdd.
isEmptyTestClass := isTestClass and: isEmptyClass.

alwaysTrue := (isOdd not or: isPositive) logicalEquals: (isOdd implies: isPositive).
```

Any combination of logical block closures is also a logical block closure:

```Smalltalk
isEmptyTestClass value: ConditionTest. "false"
isPositiveOrOdd value: -1. "true".
alwaysTrue value: (Random new next). "true"
```
