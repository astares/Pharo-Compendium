"
Browse the selected artifact
"
Class {
	#name : #PHCBrowseItemURLCommand,
	#superclass : #PHCCommand,
	#category : #'Pharo-Compendium-UI-Commands'
}

{ #category : #accessing }
PHCBrowseItemURLCommand class >> defaultName [

	^'Browse'
]

{ #category : #executing }
PHCBrowseItemURLCommand >> execute [
	 
	self context selectedItem ifNotNil: [:item | WebBrowser openOn: item url ]
		
]
