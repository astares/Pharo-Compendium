"
An item within the legacy Pharo catalog
"
Class {
	#name : #PHCCatalogEntry,
	#superclass : #PHCCatalogItem,
	#instVars : [
		'contactInfo',
		'keywords',
		'packageName'
	],
	#category : #'Pharo-Compendium-Plugins-Catalog-Core-Model'
}

{ #category : #accessing }
PHCCatalogEntry >> contactInfo [
	^ contactInfo
]

{ #category : #accessing }
PHCCatalogEntry >> contactInfo: anObject [
	contactInfo := anObject
]

{ #category : #accessing }
PHCCatalogEntry >> keywords [
	^ keywords
]

{ #category : #accessing }
PHCCatalogEntry >> keywords: anObject [
	keywords := anObject
]

{ #category : #accessing }
PHCCatalogEntry >> packageName [
	^ packageName
]

{ #category : #accessing }
PHCCatalogEntry >> packageName: anObject [
	packageName := anObject
]
