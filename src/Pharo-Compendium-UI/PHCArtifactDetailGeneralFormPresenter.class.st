"
Artefact presenter
"
Class {
	#name : #PHCArtifactDetailGeneralFormPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'nameLabel',
		'nameInput',
		'descriptionInput',
		'descriptionLabel',
		'urlLabel',
		'urlInput',
		'artifact'
	],
	#category : #'Pharo-Compendium-UI-Components'
}

{ #category : #specs }
PHCArtifactDetailGeneralFormPresenter class >> defaultSpec [
	
	^ SpBoxLayout newVertical
		add:
			(SpGridLayout new
				add: #nameLabel at: 1 @ 1; add: #nameInput at: 2 @ 1;
				add: #descriptionLabel at: 1 @ 2; add: #descriptionInput at: 2 @ 2;
				add: #urlLabel at: 1 @ 3; add: #urlInput at: 2 @ 3
			);
		yourself
]

{ #category : #showing }
PHCArtifactDetailGeneralFormPresenter class >> open [
	<script>

	self new openWithSpec
]

{ #category : #accessing }
PHCArtifactDetailGeneralFormPresenter >> artifact [
	^ artifact
]

{ #category : #accessing }
PHCArtifactDetailGeneralFormPresenter >> artifact: anObject [
	artifact := anObject.
	self update
]

{ #category : #'initialize - release' }
PHCArtifactDetailGeneralFormPresenter >> initializePresenters [
 
	nameLabel := self newLabel label: 'Name:'.
	nameInput := self newTextInput.
	descriptionLabel := self newLabel label: 'Description:'.
	descriptionInput := self newTextInput.
	urlLabel := self newLabel label: 'URL:'.
	urlInput := self newLink.
	
	
]

{ #category : #'initialize - release' }
PHCArtifactDetailGeneralFormPresenter >> update [
	super update.
	artifact ifNotNil: [ 
		nameInput text: artifact name.
		descriptionInput text: artifact description.
		urlInput url: artifact url.
	]
]
