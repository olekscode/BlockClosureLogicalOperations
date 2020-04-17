Extension { #name : #BlockClosure }

{ #category : #'*Condition' }
BlockClosure >> asCondition [
	^ Condition newFrom: self
]
