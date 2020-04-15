"
A loadable item
"
Trait {
	#name : #TLoadable,
	#instVars : [
		'loadable'
	],
	#category : #'Pharo-Compendium-Core-Traits'
}

{ #category : #testing }
TLoadable >> isLoadable [

	^loadable
]

{ #category : #accessing }
TLoadable >> loadable: anObject [
	loadable := anObject
]
