Extension { #name : #PHCArtifact }

{ #category : #'*Pharo-Compendium-Plugins-GitHub-UI' }
PHCArtifact class >> spotterActivationCommand [
	"Return the command used when the item is activated in Spotter"
	
	^self subclassResponsibility 
]
