"
GitHub
"
Class {
	#name : #PHCGitHub,
	#superclass : #PHCArtifactRegistry,
	#traits : 'PHCTBrowseable',
	#classTraits : 'PHCTBrowseable classTrait',
	#category : #'Pharo-Compendium-Extensions-GitHub-Core-Model'
}

{ #category : #accessing }
PHCGitHub class >> baseURL [
	"Return the GitHub base URL"
	
	^'http://www.github.com'
]

{ #category : #accessing }
PHCGitHub >> defaultName [

	^'GitHub'
]

{ #category : #initialization }
PHCGitHub >> initialize [
	"Initializes the receiver"
	
	super initialize.
	self url: self class baseURL
]
