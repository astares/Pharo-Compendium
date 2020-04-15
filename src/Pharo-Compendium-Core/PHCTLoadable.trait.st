"
A loadable item
"
Trait {
	#name : #PHCTLoadable,
	#instVars : [
		'loadable'
	],
	#category : #'Pharo-Compendium-Core-Traits'
}

{ #category : #testing }
PHCTLoadable >> isLoadable [

	^loadable
]

{ #category : #accessing }
PHCTLoadable >> loadable: anObject [
	loadable := anObject
]
