Extension { #name : #PHCGitHub }

{ #category : #'*Pharo-Compendium-Plugins-GitHub-UI' }
PHCGitHub class >> contextCommands [

	^#(PHCBrowseItemURLCommand)
]

{ #category : #'*Pharo-Compendium-Plugins-GitHub-UI' }
PHCGitHub class >> systemIcon [ 
	^PHCIconCache iconForClass: self name asSymbol
]
