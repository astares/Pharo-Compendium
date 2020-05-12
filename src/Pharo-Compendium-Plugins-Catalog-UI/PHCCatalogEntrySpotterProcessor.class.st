"
Spotter processor for catalog entries
"
Class {
	#name : #PHCCatalogEntrySpotterProcessor,
	#superclass : #PHCSpotterProcessor,
	#category : #'Pharo-Compendium-Plugins-Catalog-UI-Spotter'
}

{ #category : #accessing }
PHCCatalogEntrySpotterProcessor class >> title [
	
	^ 'Compendium - Catalog Entries'
]

{ #category : #accessing }
PHCCatalogEntrySpotterProcessor >> collection [ 
	|coll catalogStore |
	catalogStore := PHCArtifactStore allArtefactStores detect: [:each | each class = PHCPharoCatalog ] ifNone: [ ^#() ].
	coll := OrderedCollection new.	
	catalogStore children do: [:each | coll addAll: each children ].
	^coll
]
