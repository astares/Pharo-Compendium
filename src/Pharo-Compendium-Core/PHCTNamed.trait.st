"
A named thing
"
Trait {
	#name : #PHCTNamed,
	#instVars : [
		'name'
	],
	#category : #'Pharo-Compendium-Core-Traits'
}

{ #category : #'private - defaults' }
PHCTNamed >> defaultName [

	^'Unnamed ', (self class name allButFirst: 3)
]

{ #category : #accessing }
PHCTNamed >> name [
	"Return the name of the receiver"
	
	^ name ifNil: [ name := self defaultName ]
]

{ #category : #accessing }
PHCTNamed >> name: aString [
	"Sets the name of the receiver to the given string"
	
	name := aString
]

{ #category : #printing }
PHCTNamed >> printOn: aStream [

	aStream nextPutAll: self name asString
]
