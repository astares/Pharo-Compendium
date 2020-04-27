"
A Compendium command
"
Class {
	#name : #PHCCommand,
	#superclass : #CmCommand,
	#category : #'Pharo-Compendium-UI-Commands'
}

{ #category : #accessing }
PHCCommand >> artifact [ 
	^self context
]

{ #category : #executing }
PHCCommand >> execute [
	"Execute the actions that should be done by the command.
	 This method expect that the context has been put in #context inst. var. if any context is relevant."
	self subclassResponsibility
]
