"
A crawler for Pharo catalog JSON
"
Class {
	#name : #PHCCatalogCrawler,
	#superclass : #Object,
	#instVars : [
		'baseURL'
	],
	#category : #'Pharo-Compendium-Plugins-Catalog-Core-Utilities'
}

{ #category : #defaults }
PHCCatalogCrawler class >> defaultCatalogSourceURL [
	"We can make this a setting later"

	^'http://catalog.pharo.org/catalog/json'
]

{ #category : #crawling }
PHCCatalogCrawler >> catalogItemFrom: aDictionary [

	^(PHCCatalogItem new)
		name: (aDictionary at: 'name' ifAbsent: nil);
		description: (aDictionary at: 'description' ifAbsent: '');		
		contactInfo: (aDictionary at: 'contactInfo' ifAbsent: '');				
		packageName: (aDictionary at: 'packageName' ifAbsent: '');				
		url: (aDictionary at: 'repositoryUrl' ifAbsent: '');				
		yourself
]

{ #category : #'initialize - release' }
PHCCatalogCrawler >> initialize [
	 
	super initialize.
	baseURL := self class defaultCatalogSourceURL
]

{ #category : #crawling }
PHCCatalogCrawler >> retrieveCatalogItems [

	| src |
	src := STON fromString: (ZnEasy get: baseURL) contents.
	^src collect: [:each | 
		self catalogItemFrom: each
	]
]
