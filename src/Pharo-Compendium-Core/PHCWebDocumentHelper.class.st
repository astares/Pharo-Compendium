"
A JSON help utility
"
Class {
	#name : #PHCWebDocumentHelper,
	#superclass : #Object,
	#category : #'Pharo-Compendium-Core-Utilities'
}

{ #category : #accessing }
PHCWebDocumentHelper class >> stonFromURL: anURLString [
	""
	| response |
	response := ZnEasy get: anURLString.
	response isSuccess ifFalse: [ nil ].
	^STON fromString: response contents
]
