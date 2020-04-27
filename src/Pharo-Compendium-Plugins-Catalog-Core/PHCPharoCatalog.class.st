"
The pharo catalog
"
Class {
	#name : #PHCPharoCatalog,
	#superclass : #PHCArtifactStore,
	#traits : 'PHCTBrowseable',
	#classTraits : 'PHCTBrowseable classTrait',
	#category : #'Pharo-Compendium-Plugins-Catalog-Core-Model'
}

{ #category : #'class initialization' }
PHCPharoCatalog class >> initialize [
	"Initializes the receiver class - register the artefact store"
	
	self registerInstance
]

{ #category : #accessing }
PHCPharoCatalog >> artifacts [

	^artifacts ifNil: [ artifacts := PHCCatalogCrawler new retrieveCatalogPharoVersions ] 
]

{ #category : #defaults }
PHCPharoCatalog >> defaultName [

	^'Catalog'
]

{ #category : #'initialize - release' }
PHCPharoCatalog >> initialize [
	"Initializes the receiver"
	
	super initialize.
	self url: 'http://catalog.pharo.org'.
	self description: 'All projects from Pharo catalog'
]
