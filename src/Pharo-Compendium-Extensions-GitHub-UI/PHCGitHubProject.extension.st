Extension { #name : #PHCGitHubProject }

{ #category : #'*Pharo-Compendium-Extensions-GitHub-UI' }
PHCGitHubProject class >> systemIcon [ 
	^PHCIconCache iconForClass: self name asSymbol
]
