Class {
	#name : #BaselineOfBlockClosureLogicalOperations,
	#superclass : #BaselineOf,
	#category : #BaselineOfBlockClosureLogicalOperations
}

{ #category : #baselines }
BaselineOfBlockClosureLogicalOperations >> baseline: spec [
	<baseline>
	spec for: #common do: [	
			
		"Packages"
		spec 
			package: 'BlockClosureLogicalOperations';
			package: 'BlockClosureLogicalOperations-Tests' with: [ spec requires: #(BlockClosureLogicalOperations) ] ].
]
