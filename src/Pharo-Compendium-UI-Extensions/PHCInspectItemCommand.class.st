"
Inspect an artifact for development purpose
"
Class {
	#name : #PHCInspectItemCommand,
	#superclass : #PHCCommand,
	#category : #'Pharo-Compendium-UI-Extensions-Commands'
}

{ #category : #executing }
PHCInspectItemCommand >> execute [
	self context inspect
]
