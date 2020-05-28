"
Items by Author
"
Class {
	#name : #PHCGitHubByAuthor,
	#superclass : #PHCGitHubStore,
	#category : #'Pharo-Compendium-Plugins-GitHub-Core-Model'
}

{ #category : #'class initialization' }
PHCGitHubByAuthor class >> initialize [
	"Initializes the receiver class - register the artefact store"
	
	self registerInstance
]

{ #category : #accessing }
PHCGitHubByAuthor >> defaultName [

	^'GitHub - By Author'
]

{ #category : #initialization }
PHCGitHubByAuthor >> initialize [

	super initialize.
	self description: 'All GitHub projects marked with Pharo topic'
]
