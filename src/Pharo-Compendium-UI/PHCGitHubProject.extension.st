Extension { #name : #PHCGitHubProject }

{ #category : #'*Pharo-Compendium-UI' }
PHCGitHubProject >> children [ 
	^owner ifNil: [ super children ] ifNotNil: [ Array with: owner ]
]
