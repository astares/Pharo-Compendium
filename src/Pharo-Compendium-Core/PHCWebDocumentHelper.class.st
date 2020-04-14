"
A JSON help utility
"
Class {
	#name : #PHCWebDocumentHelper,
	#superclass : #Object,
	#category : #'Pharo-Compendium-Core-Utilities'
}

{ #category : #examples }
PHCWebDocumentHelper class >> example [

	self withDictionaryFromJSONURL: 'https://api.github.com/search/repositories?q=language:smalltalk+topic:pharo-catalog' do: [:dic | dic inspect ]
]

{ #category : #accessing }
PHCWebDocumentHelper class >> stonFromURL: anURLString [
	"Return a STON response or nil for the given JSON URL
	
		anURLString - a string representing a JSON URL
	"
	
	| response |
	response := ZnEasy get: anURLString.
	response isSuccess ifFalse: [ nil ].
	^[ STON fromString: response contents ]
		on: Error do: [ ^nil ]
		
]

{ #category : #accessing }
PHCWebDocumentHelper class >> withDictionaryFromJSONURL: anURLString do: aBlock [

	^(self stonFromURL: anURLString)
			ifNotNil: aBlock
]
