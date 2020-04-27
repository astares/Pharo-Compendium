"
An item within the legacy Pharo catalog
"
Class {
	#name : #PHCCatalogItem,
	#superclass : #PHCArtifact,
	#traits : 'PHCTBrowseable',
	#classTraits : 'PHCTBrowseable classTrait',
	#instVars : [
		'contactInfo',
		'keywords',
		'packageName'
	],
	#category : #'Pharo-Compendium-Plugins-Catalog-Core-Model'
}

{ #category : #accessing }
PHCCatalogItem >> contactInfo [
	^ contactInfo
]

{ #category : #accessing }
PHCCatalogItem >> contactInfo: anObject [
	contactInfo := anObject
]

{ #category : #accessing }
PHCCatalogItem >> keywords [
	^ keywords
]

{ #category : #accessing }
PHCCatalogItem >> keywords: anObject [
	keywords := anObject
]

{ #category : #accessing }
PHCCatalogItem >> packageName [
	^ packageName
]

{ #category : #accessing }
PHCCatalogItem >> packageName: anObject [
	packageName := anObject
]
