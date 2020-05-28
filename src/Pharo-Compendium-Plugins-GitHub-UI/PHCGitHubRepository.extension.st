Extension { #name : #PHCGitHubRepository }

{ #category : #'*Pharo-Compendium-Plugins-GitHub-UI' }
PHCGitHubRepository >> children [ 
	^owner ifNil: [ super children ] ifNotNil: [ Array with: owner ]
]

{ #category : #'*Pharo-Compendium-Plugins-GitHub-UI' }
PHCGitHubRepository class >> contextCommands [

	^#(PHCBrowseItemURLCommand #PHCCloneUsingHTTPSCommand)
]

{ #category : #'*Pharo-Compendium-Plugins-GitHub-UI' }
PHCGitHubRepository class >> spotterActivationCommand [
	"Return the command class used when the item is activated in Spotter"
	
	^PHCCloneUsingHTTPSCommand
]
