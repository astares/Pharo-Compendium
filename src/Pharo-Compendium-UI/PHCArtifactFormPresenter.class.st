"
Common superclass for form based detail presenters
"
Class {
	#name : #PHCArtifactFormPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'nameLabel',
		'nameInput',
		'descriptionInput',
		'descriptionLabel',
		'artifact'
	],
	#category : #'Pharo-Compendium-UI-Components'
}

{ #category : #specs }
PHCArtifactFormPresenter class >> defaultSpec [
	
	^ SpBoxLayout newVertical
		add:
			(SpGridLayout new
				add: #nameLabel at: 1 @ 1; add: #nameInput at: 2 @ 1;
				add: #descriptionLabel at: 1 @ 2; add: #descriptionInput at: 2 @ 2			
			);
		yourself
]

{ #category : #showing }
PHCArtifactFormPresenter class >> open [
	<script>

	self new openWithSpec
]

{ #category : #accessing }
PHCArtifactFormPresenter >> artifact [
	^ artifact
]

{ #category : #accessing }
PHCArtifactFormPresenter >> artifact: anObject [
	artifact := anObject.
	self update
]

{ #category : #'initialize - release' }
PHCArtifactFormPresenter >> initializePresenters [
 
	nameLabel := self newLabel label: 'Name:'.
	nameInput := self newTextInput.
	descriptionLabel := self newLabel label: 'Description:'.
	descriptionInput := self newTextInput.
	
	
]

{ #category : #updating }
PHCArtifactFormPresenter >> update [
	super update.
	artifact ifNotNil: [ 
		nameInput text: artifact name.
		descriptionInput text: artifact description.	 
	]
]
