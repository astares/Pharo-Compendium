"
A general presenter for GitHub artifacts
"
Class {
	#name : #PHCGitHubArtifactFormPresenter,
	#superclass : #PHCArtifactFormPresenter,
	#instVars : [
		'urlLabel',
		'urlInput'
	],
	#category : #'Pharo-Compendium-Extensions-GitHub-UI-Components'
}

{ #category : #specs }
PHCGitHubArtifactFormPresenter class >> defaultSpec [
	
	^ SpBoxLayout newVertical
		add:
			(SpGridLayout new
				add: #nameLabel at: 1 @ 1; add: #nameInput at: 2 @ 1;
				add: #descriptionLabel at: 1 @ 2; add: #descriptionInput at: 2 @ 2;
				add: #urlLabel at: 1 @ 3; add: #urlInput at: 2 @ 3
			);
		yourself
]

{ #category : #showing }
PHCGitHubArtifactFormPresenter class >> open [
	<script>

	self new openWithSpec
]

{ #category : #'initialize - release' }
PHCGitHubArtifactFormPresenter >> initializePresenters [ 

	super initializePresenters.
	urlLabel := self newLabel label: 'URL:'.
	urlInput := self newLink.
	
]

{ #category : #updating }
PHCGitHubArtifactFormPresenter >> update [
	super update.
	artifact ifNotNil: [ urlInput url: artifact url ]
]
