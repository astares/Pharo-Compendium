"
Abstract superclass for catalog related items
"
Class {
	#name : #PHCCatalogItem,
	#superclass : #PHCArtifact,
	#traits : 'PHCTBrowseable',
	#classTraits : 'PHCTBrowseable classTrait',
	#category : #'Pharo-Compendium-Plugins-Catalog-Core-Model'
}

{ #category : #testing }
PHCCatalogItem class >> isAbstract [ 
	
	^self = PHCCatalogItem
]
