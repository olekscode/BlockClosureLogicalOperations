Extension { #name : #BlockClosure }

{ #category : #'*BlockClosureLogicalOperations' }
BlockClosure >> and: anotherCondition [
	^ [ :anObject | (self value: anObject) and: [ anotherCondition value: anObject ] ].
]

{ #category : #'*BlockClosureLogicalOperations' }
BlockClosure >> implies: anotherCondition [
	^ [ :anObject | (self value: anObject) ==> [ anotherCondition value: anObject ] ].
]

{ #category : #'*BlockClosureLogicalOperations' }
BlockClosure >> logicalEquals: anotherCondition [
	^ [ :anObject | (self value: anObject) eqv: ( anotherCondition value: anObject ) ].
]

{ #category : #'*BlockClosureLogicalOperations' }
BlockClosure >> not [
	^ [ :anObject | (self value: anObject) not ].
]

{ #category : #'*BlockClosureLogicalOperations' }
BlockClosure >> or: anotherCondition [
	^ [ :anObject | (self value: anObject) or: [ anotherCondition value: anObject ] ].
]

{ #category : #'*BlockClosureLogicalOperations' }
BlockClosure >> xor: anotherCondition [
	^ [ :anObject | (self value: anObject) xor: [ anotherCondition value: anObject ] ].
]
