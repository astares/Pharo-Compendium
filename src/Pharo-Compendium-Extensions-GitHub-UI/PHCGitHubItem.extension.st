Extension { #name : #PHCGitHubItem }

{ #category : #'*Pharo-Compendium-Extensions-GitHub-UI' }
PHCGitHubItem class >> detailPresenters [ 

	^#(PHCGitHubItemFormPresenter)
]

{ #category : #'*Pharo-Compendium-Extensions-GitHub-UI' }
PHCGitHubItem class >> systemIcon [
	
	^PHCIconCache iconForClass: #PHCGitHub
]
