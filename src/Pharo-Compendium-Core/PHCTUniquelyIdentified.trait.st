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

{ #category : #comparing }
PHCTUniquelyIdentified >> = anotherObject [
	^anotherObject class == self class
		and: [ anotherObject id = self id ]
	
]

{ #category : #'private - utilities' }
PHCTUniquelyIdentified >> generateUniqueID [

	^self class generateUniqueID
]

{ #category : #comparing }
PHCTUniquelyIdentified >> hash [

	^id hash 
]

{ #category : #accessing }
PHCTUniquelyIdentified >> id [
	"Returns the receivers unique identifier"
	
	^ id ifNil: [ id := self generateUniqueID ]
]

{ #category : #accessing }
PHCTUniquelyIdentified >> id: anObject [
	"Sets the receivers unique identifier"
	
	id := anObject
]
