Extension { #name : #PHCGitHubProject }

{ #category : #'*Pharo-Compendium-Plugins-GitHub-UI' }
PHCGitHubProject >> children [ 
	^owner ifNil: [ super children ] ifNotNil: [ Array with: owner ]
]
