Class {
	#name : #PHCGitHubByAuthor,
	#superclass : #PHCGitHub,
	#category : #'Pharo-Compendium-Plugins-GitHub-Core-Model'
}

{ #category : #'class initialization' }
PHCGitHubByAuthor class >> initialize [
	"Initializes the receiver class - register the artefact store"
	
	self registerInstance
]

{ #category : #'class initialization' }
PHCGitHubByAuthor class >> systemIcon [

	^PHCIconCache iconForClass: self superclass name asSymbol
]
