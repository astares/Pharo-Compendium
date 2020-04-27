"
The pharo catalog
"
Class {
	#name : #PHCPharoCatalog,
	#superclass : #PHCArtifactStore,
	#category : #'Pharo-Compendium-Plugins-Catalog-Core-Model'
}

{ #category : #'class initialization' }
PHCPharoCatalog class >> initialize [
	"Initializes the receiver class - register the artefact store"
	
	self registerInstance
]

{ #category : #accessing }
PHCPharoCatalog >> artifacts [

	^PHCCatalogCrawler new retrieveCatalogItems 
]

{ #category : #defaults }
PHCPharoCatalog >> defaultName [

	^'Catalog'
]
