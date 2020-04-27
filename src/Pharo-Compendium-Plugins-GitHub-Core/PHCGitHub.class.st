"
GitHub
"
Class {
	#name : #PHCGitHub,
	#superclass : #PHCArtifactStore,
	#traits : 'PHCTBrowseable',
	#classTraits : 'PHCTBrowseable classTrait',
	#category : #'Pharo-Compendium-Plugins-GitHub-Core-Model'
}

{ #category : #accessing }
PHCGitHub class >> baseURL [
	"Return the GitHub base URL"
	
	^'http://www.github.com'
]

{ #category : #'class initialization' }
PHCGitHub class >> initialize [
	"Initializes the receiver class - register the artefact store"
	
	self registerInstance
]

{ #category : #artefacts }
PHCGitHub >> artifacts [

	^artifacts ifNil: [ artifacts := PHCGitHubCrawler new retrieveRepositories ]
]

{ #category : #accessing }
PHCGitHub >> defaultName [

	^'GitHub'
]

{ #category : #initialization }
PHCGitHub >> initialize [
	"Initializes the receiver"
	
	super initialize.
	self url: self class baseURL.
	self description: 'All GitHub projects marked with Pharo topic'
]
