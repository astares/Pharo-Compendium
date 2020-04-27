"
A Pharo version in catalog
"
Class {
	#name : #PHCCatalogPharoVersion,
	#superclass : #PHCCatalogItem,
	#instVars : [
		'entries'
	],
	#category : #'Pharo-Compendium-Plugins-Catalog-Core-Model'
}

{ #category : #accessing }
PHCCatalogPharoVersion >> addEntry: aCatalogEntry [

	self entries add: aCatalogEntry
]

{ #category : #accessing }
PHCCatalogPharoVersion >> entries [
	^ entries ifNil: [ entries := OrderedCollection new ]
]

{ #category : #accessing }
PHCCatalogPharoVersion >> entries: anObject [
	entries := anObject
]
