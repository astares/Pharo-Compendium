Extension { #name : #PHCGitHubProject }

{ #category : #'*Pharo-Compendium-Plugins-GitHub-UI' }
PHCGitHubProject >> children [ 
	^owner ifNil: [ super children ] ifNotNil: [ Array with: owner ]
]

{ #category : #'*Pharo-Compendium-Plugins-GitHub-UI' }
PHCGitHubProject class >> contextCommands [

	^#(PHCBrowseItemURLCommand #PHCCloneUsingHTTPSCommand)
]

{ #category : #'*Pharo-Compendium-Plugins-GitHub-UI' }
PHCGitHubProject class >> spotterActivationCommand [
	"Return the command class used when the item is activated in Spotter"
	
	^PHCCloneUsingHTTPSCommand
]
