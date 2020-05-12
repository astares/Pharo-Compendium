Extension { #name : #PHCGitHubProject }

{ #category : #'*Pharo-Compendium-UI' }
PHCGitHubProject class >> spotterActivationCommand [
	"Return the command class used when the item is activated in Spotter"
	
	^PHCCloneUsingHTTPSCommand
]
