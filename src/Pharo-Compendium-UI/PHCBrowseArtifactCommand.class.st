"
Browse the selected artifact
"
Class {
	#name : #PHCBrowseArtifactCommand,
	#superclass : #PHCCommand,
	#category : #'Pharo-Compendium-UI-Commands'
}

{ #category : #accessing }
PHCBrowseArtifactCommand class >> defaultName [

	^'Browse'
]

{ #category : #executing }
PHCBrowseArtifactCommand >> execute [
	 
	self context selectedArtifact ifNotNil: [:item | WebBrowser openOn: item url ]
		
]
