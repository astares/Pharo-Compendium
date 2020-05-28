"
Items per repository
"
Class {
	#name : #PHCGitHubByRepository,
	#superclass : #PHCGitHubStore,
	#category : #'Pharo-Compendium-Plugins-GitHub-Core'
}

{ #category : #'class initialization' }
PHCGitHubByRepository class >> initialize [
	"Initializes the receiver class - register the artefact store"
	
	self registerInstance
]

{ #category : #accessing }
PHCGitHubByRepository >> defaultName [

	^'GitHub - By Repository'
]
