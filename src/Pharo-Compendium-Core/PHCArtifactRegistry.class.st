"
Common superclass for artifact stores
"
Class {
	#name : #PHCArtifactRegistry,
	#superclass : #PHCCompendiumItem,
	#classVars : [
		'AllRestries'
	],
	#category : #'Pharo-Compendium-Core-Model'
}

{ #category : #accessing }
PHCArtifactRegistry class >> allRegistries [
	"Return a collection of all registries"
	
	^AllRestries ifNil: [ AllRestries := OrderedCollection new ]
]

{ #category : #testing }
PHCArtifactRegistry class >> isAbstract [ 
	"Return true if the receiver is abstract, false otherwise"
	
	^self == PHCArtifactRegistry 
]
