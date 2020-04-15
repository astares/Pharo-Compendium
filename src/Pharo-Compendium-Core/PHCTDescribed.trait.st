"
Objects that are described provide a description
"
Trait {
	#name : #PHCTDescribed,
	#instVars : [
		'description'
	],
	#category : #'Pharo-Compendium-Core-Traits'
}

{ #category : #accessing }
PHCTDescribed >> description [
	^ description ifNil: [ description := '' ]
]

{ #category : #accessing }
PHCTDescribed >> description: anObject [
	description := anObject
]
