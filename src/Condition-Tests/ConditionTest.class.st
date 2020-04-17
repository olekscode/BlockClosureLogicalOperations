Class {
	#name : #ConditionTest,
	#superclass : #TestCase,
	#category : #'Condition-Tests'
}

{ #category : #tests }
ConditionTest >> testAnd [
	| isPositive isOdd isPositiveOdd |
	
	isPositive := [ :x | x > 0 ] asCondition.
	isOdd := [ :x | x % 2 = 1 ] asCondition.
	isPositiveOdd := isPositive and: isOdd.
	
	self deny: (isPositiveOdd value: -2).
	self deny: (isPositiveOdd value: -1).
	self assert: (isPositiveOdd value: 1).
	self deny: (isPositiveOdd value: 2).
]

{ #category : #testing }
ConditionTest >> testCanConvertOneArgumentBlockToCondition [
	| block isPositive |
	block := [ :x | x > 0 ].
	isPositive := block asCondition.
	
	self assert: isPositive class equals: Condition.
	self assert: isPositive asBlock equals: block. 
]

{ #category : #testing }
ConditionTest >> testCanNotConvertBlockWithoutArgumentsToCondition [
	| block |
	block := [ true ].
	self should: [ block asCondition ] raise: Error.
]

{ #category : #testing }
ConditionTest >> testCanNotConvertTwoArgumentBlockToCondition [
	| block |
	block := [ :a :b | a > b ].
	self should: [ block asCondition ] raise: Error.
]

{ #category : #tests }
ConditionTest >> testImplies [
	| isPositive isOdd doesPositiveImplyOdd |
	
	isPositive := [ :x | x > 0 ] asCondition.
	isOdd := [ :x | x % 2 = 1 ] asCondition.
	doesPositiveImplyOdd := isPositive implies: isOdd.
	
	self assert: (doesPositiveImplyOdd value: -2).
	self assert: (doesPositiveImplyOdd value: -1).
	self assert: (doesPositiveImplyOdd value: 1).
	self deny: (doesPositiveImplyOdd value: 2).
]

{ #category : #tests }
ConditionTest >> testLogicalEquals [
	| isPositive isOdd doesPositiveEqualOdd |
	
	isPositive := [ :x | x > 0 ] asCondition.
	isOdd := [ :x | x % 2 = 1 ] asCondition.
	doesPositiveEqualOdd := isPositive logicalEquals: isOdd.
	
	self assert: (doesPositiveEqualOdd value: -2).
	self deny: (doesPositiveEqualOdd value: -1).
	self assert: (doesPositiveEqualOdd value: 1).
	self deny: (doesPositiveEqualOdd value: 2).
]

{ #category : #tests }
ConditionTest >> testNot [
	| isPositive isNotPositive |
	
	isPositive := [ :x | x > 0 ] asCondition.
	isNotPositive := isPositive not.
	
	self assert: (isNotPositive value: -2).
	self assert: (isNotPositive value: -1).
	self deny: (isNotPositive value: 1).
	self deny: (isNotPositive value: 2).
]

{ #category : #tests }
ConditionTest >> testOr [
	| isPositive isOdd isPositiveOrOdd |
	
	isPositive := [ :x | x > 0 ] asCondition.
	isOdd := [ :x | x % 2 = 1 ] asCondition.
	isPositiveOrOdd := isPositive or: isOdd.
	
	self deny: (isPositiveOrOdd value: -2).
	self assert: (isPositiveOrOdd value: -1).
	self assert: (isPositiveOrOdd value: 1).
	self assert: (isPositiveOrOdd value: 2).
]

{ #category : #tests }
ConditionTest >> testValue [
	| isPositive |
	isPositive := [ :x | x > 0 ] asCondition.
	
	self deny: (isPositive value: -2).
	self deny: (isPositive value: -1).
	self assert: (isPositive value: 1).
	self assert: (isPositive value: 2).
]

{ #category : #tests }
ConditionTest >> testXor [
	| isPositive isOdd isPositiveXorOdd |
	
	isPositive := [ :x | x > 0 ] asCondition.
	isOdd := [ :x | x % 2 = 1 ] asCondition.
	isPositiveXorOdd := isPositive xor: isOdd.
	
	self deny: (isPositiveXorOdd value: -2).
	self assert: (isPositiveXorOdd value: -1).
	self deny: (isPositiveXorOdd value: 1).
	self assert: (isPositiveXorOdd value: 2).
]
