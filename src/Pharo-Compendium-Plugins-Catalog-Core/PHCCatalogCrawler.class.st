"
A crawler for Pharo catalog JSON
"
Class {
	#name : #PHCCatalogCrawler,
	#superclass : #Object,
	#instVars : [
		'baseURL',
		'repoMappings'
	],
	#category : #'Pharo-Compendium-Plugins-Catalog-Core-Utilities'
}

{ #category : #defaults }
PHCCatalogCrawler class >> defaultCatalogSourceURL [
	"We can make this a setting later"

	^'http://catalog.pharo.org/catalog/json'
]

{ #category : #'private - accessing' }
PHCCatalogCrawler >> catalogItemFrom: aDictionary [

	^(PHCCatalogEntry new)
		name: (aDictionary at: 'name' ifAbsent: nil);
		description: (aDictionary at: 'description' ifAbsent: '');		
		contactInfo: (aDictionary at: 'contactInfo' ifAbsent: '');				
		packageName: (aDictionary at: 'packageName' ifAbsent: '');				
		url: (aDictionary at: 'repositoryUrl' ifAbsent: '');				
		yourself
]

{ #category : #'private - accessing' }
PHCCatalogCrawler >> catalogVersionEntryFrom: each [

	^PHCCatalogPharoVersion new
		name: each value
		url: each key
]

{ #category : #'private - initialization' }
PHCCatalogCrawler >> initRepoMappings [

	|repos|
	repos := Dictionary new.	
	3 to: SystemVersion current major do: [:v | 
		repos 	
			at: ('http://smalltalkhub.com/mc/Pharo/MetaRepoForPharo{1}0/main' format: {v})
			put: ('Pharo{1}.0' format: {v})].
	repos at: 'http://www.squeaksource.com/MetacelloRepository' put: 'Unsorted'.		
	^repos
]

{ #category : #'initialize - release' }
PHCCatalogCrawler >> initialize [
	 
	super initialize.
	baseURL := self class defaultCatalogSourceURL.
	repoMappings := self initRepoMappings
]

{ #category : #crawling }
PHCCatalogCrawler >> retrieveCatalogItems [

	| src items |
	src := STON fromString: (ZnEasy get: baseURL) contents.
	repoMappings collect: [:each | 
		self catalogVersionEntryFrom: each
	].
	
	items := src collect: [:each | 
		self catalogItemFrom: each
	].
	
	^items
]
