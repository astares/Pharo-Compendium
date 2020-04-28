"
A general presenter for GitHub artifacts
"
Class {
	#name : #PHCGitHubItemFormPresenter,
	#superclass : #PHCItemFormPresenter,
	#instVars : [
		'url'
	],
	#category : #'Pharo-Compendium-Plugins-GitHub-UI-Components'
}

{ #category : #specs }
PHCGitHubItemFormPresenter class >> defaultSpec [
	
	^ super defaultSpec 
			add: #url withConstraints: [ :constraints | constraints height: self inputTextHeight ];				 
			yourself
]

{ #category : #showing }
PHCGitHubItemFormPresenter class >> open [
	<script>

	self new openWithSpec
]

{ #category : #'initialize - release' }
PHCGitHubItemFormPresenter >> initializePresenters [ 

	super initializePresenters.	
	url := self instantiate: (SpLabelledPresenter label: 'URL:' input: self newLink)
	
	
]

{ #category : #updating }
PHCGitHubItemFormPresenter >> update [
	super update.
	artifact ifNotNil: [ url input url: artifact url ]
]
