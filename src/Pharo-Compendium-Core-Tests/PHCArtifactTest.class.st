Class {
	#name : #PHCArtifactTest,
	#superclass : #TestCase,
	#instVars : [
		'artifact'
	],
	#category : #'Pharo-Compendium-Core-Tests-Model'
}

{ #category : #running }
PHCArtifactTest >> setUp [ 
	super setUp.
	artifact := PHCArtifact new
]

{ #category : #tests }
PHCArtifactTest >> testDefaultName [

	self assert: artifact name equals: 'Unnamed Artifact'
]

{ #category : #tests }
PHCArtifactTest >> testInitializedWithUUID [

	self assert: artifact id size equals: 32
]

{ #category : #tests }
PHCArtifactTest >> testInstanceCreation [

	self assert: (PHCArtifact named: 'New Artifact') name equals: 'New Artifact'
]

{ #category : #tests }
PHCArtifactTest >> testLazyEmptyDescription [

	self assert: artifact description isEmpty
]
