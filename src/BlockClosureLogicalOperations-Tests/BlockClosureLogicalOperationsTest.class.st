Class {
	#name : #BlockClosureLogicalOperationsTest,
	#superclass : #TestCase,
	#category : #'BlockClosureLogicalOperations-Tests'
}

{ #category : #tests }
BlockClosureLogicalOperationsTest >> testAnd [
	| isPositive isOdd isPositiveOdd |
	
	isPositive := [ :x | x > 0 ].
	isOdd := [ :x | x % 2 = 1 ].
	isPositiveOdd := isPositive and: isOdd.
	
	self deny: (isPositiveOdd value: -2).
	self deny: (isPositiveOdd value: -1).
	self assert: (isPositiveOdd value: 1).
	self deny: (isPositiveOdd value: 2).
]

{ #category : #tests }
BlockClosureLogicalOperationsTest >> testImplies [
	| isPositive isOdd doesPositiveImplyOdd |
	
	isPositive := [ :x | x > 0 ].
	isOdd := [ :x | x % 2 = 1 ].
	doesPositiveImplyOdd := isPositive implies: isOdd.
	
	self assert: (doesPositiveImplyOdd value: -2).
	self assert: (doesPositiveImplyOdd value: -1).
	self assert: (doesPositiveImplyOdd value: 1).
	self deny: (doesPositiveImplyOdd value: 2).
]

{ #category : #tests }
BlockClosureLogicalOperationsTest >> testLogicalEquals [
	| isPositive isOdd doesPositiveEqualOdd |
	
	isPositive := [ :x | x > 0 ].
	isOdd := [ :x | x % 2 = 1 ].
	doesPositiveEqualOdd := isPositive logicalEquals: isOdd.
	
	self assert: (doesPositiveEqualOdd value: -2).
	self deny: (doesPositiveEqualOdd value: -1).
	self assert: (doesPositiveEqualOdd value: 1).
	self deny: (doesPositiveEqualOdd value: 2).
]

{ #category : #tests }
BlockClosureLogicalOperationsTest >> testNot [
	| isPositive isNotPositive |
	
	isPositive := [ :x | x > 0 ].
	isNotPositive := isPositive not.
	
	self assert: (isNotPositive value: -2).
	self assert: (isNotPositive value: -1).
	self deny: (isNotPositive value: 1).
	self deny: (isNotPositive value: 2).
]

{ #category : #tests }
BlockClosureLogicalOperationsTest >> testOr [
	| isPositive isOdd isPositiveOrOdd |
	
	isPositive := [ :x | x > 0 ].
	isOdd := [ :x | x % 2 = 1 ].
	isPositiveOrOdd := isPositive or: isOdd.
	
	self deny: (isPositiveOrOdd value: -2).
	self assert: (isPositiveOrOdd value: -1).
	self assert: (isPositiveOrOdd value: 1).
	self assert: (isPositiveOrOdd value: 2).
]

{ #category : #tests }
BlockClosureLogicalOperationsTest >> testXor [
	| isPositive isOdd isPositiveXorOdd |
	
	isPositive := [ :x | x > 0 ].
	isOdd := [ :x | x % 2 = 1 ].
	isPositiveXorOdd := isPositive xor: isOdd.
	
	self deny: (isPositiveXorOdd value: -2).
	self assert: (isPositiveXorOdd value: -1).
	self deny: (isPositiveXorOdd value: 1).
	self assert: (isPositiveXorOdd value: 2).
]
