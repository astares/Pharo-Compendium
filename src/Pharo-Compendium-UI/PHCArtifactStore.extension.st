Extension { #name : #PHCArtifactStore }

{ #category : #'*Pharo-Compendium-UI' }
PHCArtifactStore >> children [

	^self artifacts 
]

{ #category : #'*Pharo-Compendium-UI' }
PHCArtifactStore class >> spotterActivationCommand [
	"Return the command used when the item is activated in Spotter"
	
	^PHCBrowseItemURLCommand 
]
