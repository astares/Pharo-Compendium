"
A Compendium command
"
Class {
	#name : #PHCCommand,
	#superclass : #CmCommand,
	#category : #'Pharo-Compendium-UI-Commands'
}

{ #category : #default }
PHCCommand class >> defaultIconName [
	^nil
]

{ #category : #converting }
PHCCommand >> asSpecCommand [
	| command |
	command := super asSpecCommand.	
	command iconProvider: PHCIconCache.
	command iconName: self defaultIconName.
	^ command
]

{ #category : #defaults }
PHCCommand >> defaultIconName [
	^self class defaultIconName
]

{ #category : #executing }
PHCCommand >> execute [
	"Execute the actions that should be done by the command.
	 This method expect that the context has been put in #context inst. var. if any context is relevant."
	self subclassResponsibility
]
