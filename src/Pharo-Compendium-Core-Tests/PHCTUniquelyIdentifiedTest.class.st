Class {
	#name : #PHCTUniquelyIdentifiedTest,
	#superclass : #TestCase,
	#instVars : [
		'uniqueID'
	],
	#category : #'Pharo-Compendium-Core-Tests-Traits'
}

{ #category : #defaults }
PHCTUniquelyIdentifiedTest >> defaultTestClass [
	"Returns the default class to test"
	
	^PHCTUniquelyIdentified
]

{ #category : #running }
PHCTUniquelyIdentifiedTest >> setUp [ 
	super setUp.
	uniqueID := self defaultTestClass generateUniqueID
]

{ #category : #tests }
PHCTUniquelyIdentifiedTest >> testGenerateUniqueIDs [

	self deny: (uniqueID includes: $-).

	self assert: (uniqueID allSatisfy: [:each | each isAlphaNumeric ])	
]

{ #category : #tests }
PHCTUniquelyIdentifiedTest >> testGenerateUniqueIDsSize [

	self assert: uniqueID size equals: 32
]
