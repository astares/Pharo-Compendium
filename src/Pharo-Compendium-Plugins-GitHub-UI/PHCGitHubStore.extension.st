Extension { #name : #PHCGitHubStore }

{ #category : #'*Pharo-Compendium-Plugins-GitHub-UI' }
PHCGitHubStore class >> contextCommands [

	^#(PHCBrowseItemURLCommand)
]

{ #category : #'*Pharo-Compendium-Plugins-GitHub-UI' }
PHCGitHubStore class >> systemIcon [ 
	^PHCIconCache iconForClass: self name asSymbol
]
