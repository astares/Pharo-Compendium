Extension { #name : #PHCGitHubItem }

{ #category : #'*Pharo-Compendium-Plugins-GitHub-UI' }
PHCGitHubItem class >> detailPresenters [ 

	^#(PHCGitHubItemFormPresenter)
]

{ #category : #'*Pharo-Compendium-Plugins-GitHub-UI' }
PHCGitHubItem class >> systemIcon [
	
	^PHCIconCache iconForClass: #PHCGitHub
]
