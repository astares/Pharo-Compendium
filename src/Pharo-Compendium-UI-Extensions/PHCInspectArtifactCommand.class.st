"
Inspect an artifact for development purpose
"
Class {
	#name : #PHCInspectArtifactCommand,
	#superclass : #PHCCommand,
	#category : #'Pharo-Compendium-UI-Extensions-Commands'
}

{ #category : #executing }
PHCInspectArtifactCommand >> execute [
	self context inspect
]
