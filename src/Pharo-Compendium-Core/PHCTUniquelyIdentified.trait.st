"
Objects that are uniquely identified
"
Trait {
	#name : #PHCTUniquelyIdentified,
	#instVars : [
		'id'
	],
	#category : #'Pharo-Compendium-Core-Traits'
}

{ #category : #utilities }
PHCTUniquelyIdentified classSide >> generateUniqueID [

	^UUID new asString copyReplaceAll: '-' with: ''
]

{ #category : #defaults }
PHCTUniquelyIdentified >> generateUniqueID [

	^self class generateUniqueID
]

{ #category : #accessing }
PHCTUniquelyIdentified >> id [
	"Returns the receivers unique ID"
	
	^ id ifNil: [ id := self generateUniqueID ]
]

{ #category : #accessing }
PHCTUniquelyIdentified >> id: anObject [
	id := anObject
]
