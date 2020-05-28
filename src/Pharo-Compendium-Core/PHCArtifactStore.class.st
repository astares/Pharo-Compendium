"
Common superclass for artifact stores
"
Class {
	#name : #PHCArtifactStore,
	#superclass : #PHCCompendiumItem,
	#instVars : [
		'artifacts'
	],
	#classVars : [
		'AllStores'
	],
	#category : #'Pharo-Compendium-Core-Model'
}

{ #category : #accessing }
PHCArtifactStore class >> addStore: aStore [
	"Add a new store instance"
	
	self allArtefactStores add: aStore 
]

{ #category : #accessing }
PHCArtifactStore class >> allArtefactStores [
	"Return a collection of all registries"
	<script: 'self allArtefactStores inspect'>
	
	^AllStores ifNil: [ AllStores := OrderedCollection new ]
]

{ #category : #'class initialization' }
PHCArtifactStore class >> initialize [
	"Subclasses should override and call 
		self registerInstance
	 to register their artefact store
	"
	
	self registerInstance 
]

{ #category : #testing }
PHCArtifactStore class >> isAbstract [ 
	"Return true if the receiver is abstract, false otherwise"
	
	^self == PHCArtifactStore 
]

{ #category : #registration }
PHCArtifactStore class >> registerInstance [
	"Register an instance of the receiver"
	
	self isAbstract ifTrue: [ ^self ].
	self addStore: self new
]

{ #category : #'class initialization' }
PHCArtifactStore class >> reset [
	<script>
	
	AllStores := nil.
	self allSubclassesDo: [:each | each registerInstance ]
]

{ #category : #'class initialization' }
PHCArtifactStore class >> resetStore [
	"Subclasses may override to additionally reset the store"
	
	self registerInstance
]

{ #category : #accessing }
PHCArtifactStore >> artifacts [

	^self subclassResponsibility 
]
