Extension { #name : #PHCGitHubUser }

{ #category : #'*Pharo-Compendium-Extensions-GitHub-UI' }
PHCGitHubUser class >> systemIcon [ 
	^PHCIconCache iconForClass: self name asSymbol
]
