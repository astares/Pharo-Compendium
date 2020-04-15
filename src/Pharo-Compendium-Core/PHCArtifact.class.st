"
A Pharo project library object
"
Class {
	#name : #PHCArtifact,
	#superclass : #Object,
	#traits : 'PHCTNamed + PHCTDescribed',
	#classTraits : 'PHCTNamed classTrait + PHCTDescribed classTrait',
	#instVars : [
		'id'
	],
	#category : #'Pharo-Compendium-Core-Model'
}

{ #category : #testing }
PHCArtifact class >> isAbstract [
	"Return true if the receiver is abstract - false otherwise"
	
	^self == PHCArtifact 
]

{ #category : #'instance creation' }
PHCArtifact class >> named: aName [

	^(self new)	
		name: aName;
		yourself
]

{ #category : #accessing }
PHCArtifact >> id [
	^ id
]

{ #category : #accessing }
PHCArtifact >> id: anObject [
	id := anObject
]

{ #category : #'private - initialization' }
PHCArtifact >> initialUniqueID [

	id := UUID new asString copyReplaceAll: '-' with: ''
]

{ #category : #initialization }
PHCArtifact >> initialize [
	super initialize.
	self initialUniqueID
]

{ #category : #testing }
PHCArtifact >> isBrowseable [
	"Its not browseable by default"
	
	^false
]

{ #category : #testing }
PHCArtifact >> isLoadable [
	"Its not loadable by default"
	
	^false
]
