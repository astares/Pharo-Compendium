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
		description: ((aDictionary at: 'description') ifNil: '');		
		contactInfo: ((aDictionary at: 'contactInfo') ifNil: '');	
		keywords: ((aDictionary at: 'keywords') ifNil: #());					
		packageName: ((aDictionary at: 'packageName') ifNil: '');				
		url: ((aDictionary at: 'repositoryUrl') ifNil: '');				
		yourself
]

{ #category : #'private - accessing' }
PHCCatalogCrawler >> catalogVersionEntryFrom: each [

	^PHCCatalogPharoVersion new
		name: each value;
		url: each key;
		yourself
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
			
	^(repos associations collect: [:each | each key -> (self catalogVersionEntryFrom: each) ]	) asDictionary 

]

{ #category : #'initialize - release' }
PHCCatalogCrawler >> initialize [
	 
	super initialize.
	baseURL := self class defaultCatalogSourceURL.
	repoMappings := self initRepoMappings
]

{ #category : #crawling }
PHCCatalogCrawler >> retrieveCatalogPharoVersions [

	| src items |
	src := [ STON fromString: (ZnEasy get: baseURL) contents ] on: NameLookupFailure do: [ ^repoMappings].
	items := src collect: [:each | self catalogItemFrom: each ].
	
	"Add entry to the appropriate Pharo version"
	items do: [:each | 
		repoMappings at: each url ifPresent: [:v | v addEntry: each ]].
	
	^repoMappings values sorted: [:a :b | a name > b name ]
]
