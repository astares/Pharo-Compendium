"
A crawler for GitHub
"
Class {
	#name : #PHCGitHubCrawler,
	#superclass : #Object,
	#instVars : [
		'baseURL',
		'client',
		'topic',
		'pageSize'
	],
	#category : #'Pharo-Compendium-Extensions-GitHub-Core-Utilities'
}

{ #category : #'private - accessing' }
PHCGitHubCrawler >> baseURL [
	^ baseURL
]

{ #category : #'private - accessing' }
PHCGitHubCrawler >> baseURL: anObject [
	baseURL := anObject
]

{ #category : #'private - accessing' }
PHCGitHubCrawler >> client [
	^ client
]

{ #category : #'private - accessing' }
PHCGitHubCrawler >> client: anObject [
	client := anObject
]

{ #category : #'private - initialization' }
PHCGitHubCrawler >> createNewClient [

	^ZnClient new
		accept: 'application/vnd.github.mercy-preview+json';
		yourself
]

{ #category : #initialization }
PHCGitHubCrawler >> initialize [
	super initialize.
	client := self createNewClient.
	baseURL := 'https://api.github.com'.	
	topic := 'pharo'.
	pageSize := 100.

]

{ #category : #utilities }
PHCGitHubCrawler >> numberOfPagesFor: anItem using: aQuery [ 
	"anItem needs to be users or repositories"
	
	| resp |
	resp := ZnEasy get: baseURL, '/search/',anItem,'?q=',aQuery,'&per_page=1&page=1'.
	^(STON fromString: resp contents) at: 'total_count'
	 
]

{ #category : #utilities }
PHCGitHubCrawler >> queryPage: pageNumber for: anItem using: aQuery withItemsDo: aBlock [
	
	| response |
	client 
		url: (baseURL, '/search/',anItem)	
		,'?q=', aQuery
		,'&per_page=', pageSize asString
		,'&page=',pageNumber asString.
		
	client contentReader: [ :entity | STON fromString: entity contents ].		
	response := client get.
	^(response at: 'items') collect: [:each | aBlock value: each ]
]

{ #category : #utilities }
PHCGitHubCrawler >> retrieveItemsFor: anItemType query: aQuery using: aBlock [
	| total coll |
	coll := OrderedCollection new.	
	total := self numberOfPagesFor: anItemType using: aQuery.
	1 to: (total // pageSize + 1) do: [:pageNumber |
		coll addAll: (self queryPage: pageNumber for: anItemType using: aQuery withItemsDo: aBlock)
	].
	^coll
]

{ #category : #crawling }
PHCGitHubCrawler >> retrieveRepositories [
	| repos query |
	query := 'language:smalltalk+topic:', topic. 
	 
	repos := self retrieveItemsFor: 'repositories' query: query using: [:each | 
		 
			PHCGitHubProject new
				id: (each at: 'id');
				name: (each at: 'name');
				description: (each at: 'description');
				url: (each at: 'html_url');
				sshURL: (each at: 'ssh_url');
				cloneURL: (each at: 'clone_url');
				yourself
	].
	^repos
]

{ #category : #accessing }
PHCGitHubCrawler >> topic [
	^ topic
]

{ #category : #accessing }
PHCGitHubCrawler >> topic: anObject [
	topic := anObject
]
