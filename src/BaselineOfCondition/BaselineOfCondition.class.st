Class {
	#name : #BaselineOfCondition,
	#superclass : #BaselineOf,
	#category : #BaselineOfCondition
}

{ #category : #baselines }
BaselineOfCondition >> baseline: spec [
	<baseline>
	spec for: #common do: [	
			
		"Packages"
		spec 
			package: 'Condition';
			package: 'Condition-Tests' with: [ spec requires: #('Condition') ] ].
]
