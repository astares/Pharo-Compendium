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
PHCArtifactRegistry class >> addRegistry: aRegistryInstance [
	"Add a new registry instance"
	
	self allRegistries add: aRegistryInstance 
]

{ #category : #accessing }
PHCArtifactRegistry class >> allRegistries [
	"Return a collection of all registries"
	<script: 'self allRegistries inspect'>
	
	^AllRestries ifNil: [ AllRestries := OrderedCollection new ]
]

{ #category : #'class initialization' }
PHCArtifactRegistry class >> initialize [
	"Subclasses should override and call 
		self registerInstance
	"
	
	self registerInstance 
]

{ #category : #testing }
PHCArtifactRegistry class >> isAbstract [ 
	"Return true if the receiver is abstract, false otherwise"
	
	^self == PHCArtifactRegistry 
]

{ #category : #registration }
PHCArtifactRegistry class >> registerInstance [
	"Register an instance of the receiver"
	
	self isAbstract ifTrue: [ ^self ].
	self addRegistry: self new
]

{ #category : #'class initialization' }
PHCArtifactRegistry class >> reset [
	<script>
	
	AllRestries := nil
]
