"
A spotter processor for compendium items
"
Class {
	#name : #PHCSpotterProcessor,
	#superclass : #SptCollectionBasedProcessor,
	#category : #'Pharo-Compendium-UI-Spotter'
}

{ #category : #'default-settings' }
PHCSpotterProcessor class >> defaultEnabled [

	^ true
]

{ #category : #accessing }
PHCSpotterProcessor class >> order [
	
	^ 80
]

{ #category : #accessing }
PHCSpotterProcessor class >> title [
	
	^ 'Compendium Store'
]

{ #category : #accessing }
PHCSpotterProcessor >> collection [
	|coll|
	coll := OrderedCollection new.
	PHCArtifactStore allArtefactStores do: [:each | coll addAll: each children ].
	^coll
]

{ #category : #filtering }
PHCSpotterProcessor >> newEntryOn: anElement [

	^ self spotterEntryClass on: anElement 
]

{ #category : #'private - accessing' }
PHCSpotterProcessor >> spotterEntryClass [
	"Return the class used for the spotter entries - subclasses can override"
	
	^PHCSpotterEntry 
]
