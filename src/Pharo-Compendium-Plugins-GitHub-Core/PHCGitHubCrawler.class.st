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
	#category : #'Pharo-Compendium-Plugins-GitHub-Core-Utilities'
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

{ #category : #'private - reading' }
PHCGitHubCrawler >> gitHubRepositoryFrom: aDictionary [

	^PHCGitHubRepository new
				id: (aDictionary at: 'id');
				name: (aDictionary at: 'name');
				description: (aDictionary at: 'description');
				url: (aDictionary at: 'html_url');
				owner: (self gitHubUserFrom: (aDictionary at: 'owner'));
				sshURL: (aDictionary at: 'ssh_url');
				cloneURL: (aDictionary at: 'clone_url');
				yourself
]

{ #category : #'private - reading' }
PHCGitHubCrawler >> gitHubUserFrom: aDictionary [

	^PHCGitHubUser new
		id: (aDictionary at: 'id');
		name: (aDictionary at: 'login');
		url: (aDictionary at: 'html_url');
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
PHCGitHubCrawler >> numberOfItemsFor: anItemType using: aQuery [ 
	"anItem needs to be users or repositories"
	
	| response |
	response := ZnEasy get: baseURL, '/search/',anItemType,'?q=',aQuery,'&per_page=1&page=1'.
	response isSuccess ifFalse: [ 0 ].
	^(STON fromString: response contents) at: 'total_count'
	 
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
	| total coll current progressBlock |
	coll := OrderedCollection new.	
	current := 0.
	total := self numberOfItemsFor: anItemType using: aQuery.
	progressBlock := [:el |
							current := current + 1.
							HTTPProgress signal: 'Retrieving...' amount: current total: total.
							aBlock value: el ].
	UIManager default informUserDuring: [ :bar |
		bar label: 'Retrieving from GitHub...'.
		[
			1 to: (total // pageSize + 1) do: [:pageNumber |
				coll addAll: (self queryPage: pageNumber for: anItemType using: aQuery withItemsDo: progressBlock)
		]]
			on: HTTPProgress 
			do: [ :progress | 
				bar label: progress printString.
				progress isEmpty ifFalse: [ bar current: progress percentage ]. 
				progress resume ]
	].
	^coll
]

{ #category : #'private - crawling' }
PHCGitHubCrawler >> retrieveRepositories [
	| repos query |
	query := 'language:smalltalk+topic:', topic. 
	 
	repos := self retrieveItemsFor: 'repositories' query: query using: [:each | 
		self gitHubRepositoryFrom: each
	].
	^repos sorted: [:a :b | a name < b name ]
]

{ #category : #accessing }
PHCGitHubCrawler >> topic [
	^ topic
]

{ #category : #accessing }
PHCGitHubCrawler >> topic: anObject [
	topic := anObject
]
