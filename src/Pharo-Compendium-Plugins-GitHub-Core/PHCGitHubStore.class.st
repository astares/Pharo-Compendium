"
GitHub
"
Class {
	#name : #PHCGitHubStore,
	#superclass : #PHCArtifactStore,
	#traits : 'PHCTBrowseable',
	#classTraits : 'PHCTBrowseable classTrait',
	#category : #'Pharo-Compendium-Plugins-GitHub-Core-Model'
}

{ #category : #accessing }
PHCGitHubStore class >> baseURL [
	"Return the GitHub base URL"
	
	^'http://www.github.com'
]

{ #category : #testing }
PHCGitHubStore class >> isAbstract [ 
	"Return true if the receiver is abstract, false otherwise"
	
	^self == PHCGitHubStore
]

{ #category : #artefacts }
PHCGitHubStore >> artifacts [

	^artifacts ifNil: [ artifacts := PHCGitHubCrawler new retrieveRepositories ]
]

{ #category : #initialization }
PHCGitHubStore >> initialize [
	"Initializes the receiver"
	
	super initialize.
	self url: self class baseURL.

]
