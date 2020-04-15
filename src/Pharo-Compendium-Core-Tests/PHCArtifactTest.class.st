Class {
	#name : #PHCArtifactTest,
	#superclass : #TestCase,
	#instVars : [
		'artifact'
	],
	#category : #'Pharo-Compendium-Core-Tests-Model'
}

{ #category : #defaults }
PHCArtifactTest >> defaultTestClass [
	^PHCArtifact 
]

{ #category : #running }
PHCArtifactTest >> setUp [ 
	super setUp.
	artifact := self defaultTestClass new
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

	self assert: (self defaultTestClass named: 'New Artifact') name equals: 'New Artifact'
]

{ #category : #tests }
PHCArtifactTest >> testLazyEmptyDescription [

	self assert: artifact description isEmpty
]
