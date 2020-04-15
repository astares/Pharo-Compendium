"
A Pharo project library object
"
Class {
	#name : #PHCArtifact,
	#superclass : #Object,
	#instVars : [
		'id',
		'name',
		'description'
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

{ #category : #defaults }
PHCArtifact >> defaultName [

	^'Unnamed ', (self class name allButFirst: 3)
]

{ #category : #accessing }
PHCArtifact >> description [
	^ description ifNil: [ description := '' ]
]

{ #category : #accessing }
PHCArtifact >> description: anObject [
	description := anObject
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
PHCArtifact >> initUniqueID [

	id := UUID new asString copyReplaceAll: '-' with: ''
]

{ #category : #initialization }
PHCArtifact >> initialize [
	super initialize.
	self initUniqueID
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

{ #category : #accessing }
PHCArtifact >> name [
	"Return the name of the receiver"
	
	^ name ifNil: [ name := self defaultName ]
]

{ #category : #accessing }
PHCArtifact >> name: aString [
	"Sets the name of the receiver to the given string"
	
	name := aString
]
