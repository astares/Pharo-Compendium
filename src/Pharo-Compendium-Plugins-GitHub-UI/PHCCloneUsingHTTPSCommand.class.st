"
Add a repo to Iceberg
"
Class {
	#name : #PHCCloneUsingHTTPSCommand,
	#superclass : #PHCCommand,
	#category : #'Pharo-Compendium-Plugins-GitHub-UI-Commands'
}

{ #category : #accessing }
PHCCloneUsingHTTPSCommand class >> defaultIconName [

	^#komitterSmalltalkhubRemote
]

{ #category : #accessing }
PHCCloneUsingHTTPSCommand class >> defaultName [

	^'HTTPS Clone to Iceberg'
]

{ #category : #executing }
PHCCloneUsingHTTPSCommand >> execute [
	| rep catalogEntry |
	catalogEntry := self context selectedItem.
	
	[
	rep := IceRepositoryCreator new
  	url: catalogEntry cloneURL;
  	createRepository ]
		on: IceDuplicatedRepository 
		do: [ :e | ^self inform: 'You already have an existing clone' ].
	
	rep register.
	IceTipRepositoriesBrowser new openWithSpec.
	self inform: 'Cloned'
]
