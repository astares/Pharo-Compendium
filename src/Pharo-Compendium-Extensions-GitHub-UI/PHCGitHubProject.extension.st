Extension { #name : #PHCGitHubProject }

{ #category : #'*Pharo-Compendium-Extensions-GitHub-UI' }
PHCGitHubProject >> children [ 
	^owner ifNil: [ super children ] ifNotNil: [ Array with: owner ]
]

{ #category : #'*Pharo-Compendium-Extensions-GitHub-UI' }
PHCGitHubProject class >> systemIcon [ 
	^PHCIconCache iconForClass: self name asSymbol
]
