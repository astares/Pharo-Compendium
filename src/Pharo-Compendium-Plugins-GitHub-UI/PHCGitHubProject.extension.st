Extension { #name : #PHCGitHubProject }

{ #category : #'*Pharo-Compendium-Plugins-GitHub-UI' }
PHCGitHubProject >> children [ 
	^owner ifNil: [ super children ] ifNotNil: [ Array with: owner ]
]

{ #category : #'*Pharo-Compendium-Plugins-GitHub-UI' }
PHCGitHubProject class >> systemIcon [ 
	^PHCIconCache iconForClass: self name asSymbol
]
