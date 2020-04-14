"
A Pharo project library object
"
Class {
	#name : #PHCArtefact,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'Pharo-Compendium-Core-Model'
}

{ #category : #testing }
PHCArtefact class >> isAbstract [
	"Return true if the receiver is abstract - false otherwise"
	
	^self == PHCArtefact 
]

{ #category : #'instance creation' }
PHCArtefact class >> named: aName [

	^(self new)	
		name: aName;
		yourself
]

{ #category : #accessing }
PHCArtefact >> name [
	"Return the name of the receiver"
	
	^ name
]

{ #category : #accessing }
PHCArtefact >> name: aString [
	"Sets the name of the receiver to the given string"
	
	name := aString
]
