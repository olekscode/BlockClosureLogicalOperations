Class {
	#name : #Condition,
	#superclass : #Object,
	#instVars : [
		'block'
	],
	#category : #Condition
}

{ #category : #'instance creation' }
Condition class >> newFrom: aBlock [ 
	^ self new initializeBlock: aBlock; yourself
]

{ #category : #enumerating }
Condition >> and: anotherCondition [
	^ [ :anObject | (self value: anObject) and: [ anotherCondition value: anObject ] ] asCondition.
]

{ #category : #converting }
Condition >> asBlock [
	^ block
]

{ #category : #converting }
Condition >> asCondition [
	^ self
]

{ #category : #enumerating }
Condition >> implies: anotherCondition [
	^ [ :anObject | (self value: anObject) ==> [ anotherCondition value: anObject ] ] asCondition.
]

{ #category : #initialization }
Condition >> initializeBlock: aOneArgumentBlock [
	aOneArgumentBlock numArgs = 1
		ifFalse: [ Error signal: 'A condition can only be defined as an one-argument block' ].

	block := aOneArgumentBlock
]

{ #category : #enumerating }
Condition >> not [
	^ [ :anObject | (self value: anObject) not ] asCondition.
]

{ #category : #enumerating }
Condition >> or: anotherCondition [
	^ [ :anObject | (self value: anObject) or: [ anotherCondition value: anObject ] ] asCondition.
]

{ #category : #evaluating }
Condition >> value: anArgument [
	^ block value: anArgument
]

{ #category : #enumerating }
Condition >> xor: anotherCondition [
	^ [ :anObject | (self value: anObject) xor: [ anotherCondition value: anObject ] ] asCondition.
]
