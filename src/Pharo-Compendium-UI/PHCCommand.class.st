"
A Compendium command
"
Class {
	#name : #PHCCommand,
	#superclass : #CmCommand,
	#category : #'Pharo-Compendium-UI-Commands'
}

{ #category : #default }
PHCCommand class >> defaultIcon [
	^nil
]

{ #category : #converting }
PHCCommand >> asSpecCommand [
	| command |
	command := super asSpecCommand.	
	self defaultIcon
		ifNotNil: [ :iconName | command icon: iconName ].
	^ command
]

{ #category : #defaults }
PHCCommand >> defaultIcon [ 
	^self class defaultIcon
]

{ #category : #executing }
PHCCommand >> execute [
	"Execute the actions that should be done by the command.
	 This method expect that the context has been put in #context inst. var. if any context is relevant."
	self subclassResponsibility
]
