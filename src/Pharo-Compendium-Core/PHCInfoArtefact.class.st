"
A Pharo project library object
"
Class {
	#name : #PHCInfoArtefact,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'Pharo-Compendium-Core-Model'
}

{ #category : #'instance creation' }
PHCInfoArtefact class >> named: aName [

	^(self new)	
		name: aName;
		yourself
]

{ #category : #accessing }
PHCInfoArtefact >> name [
	^ name
]

{ #category : #accessing }
PHCInfoArtefact >> name: anObject [
	name := anObject
]
