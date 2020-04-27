"
Common superclass for form based detail presenters
"
Class {
	#name : #PHCItemFormPresenter,
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
PHCItemFormPresenter class >> defaultSpec [
	
	^ SpBoxLayout newVertical
		add:
			(SpGridLayout new
				add: #nameLabel at: 1 @ 1; add: #nameInput at: 2 @ 1;
				add: #descriptionLabel at: 1 @ 2; add: #descriptionInput at: 2 @ 2			
			);
		yourself
]

{ #category : #showing }
PHCItemFormPresenter class >> open [
	<script>

	self new openWithSpec
]

{ #category : #accessing }
PHCItemFormPresenter >> artifact [
	^ artifact
]

{ #category : #accessing }
PHCItemFormPresenter >> artifact: anObject [
	artifact := anObject.
	self update
]

{ #category : #'initialize - release' }
PHCItemFormPresenter >> initializePresenters [
 
	nameLabel := self newLabel label: 'Name:'.
	nameInput := self newTextInput.
	descriptionLabel := self newLabel label: 'Description:'.
	descriptionInput := self newTextInput.
	
	
]

{ #category : #accessing }
PHCItemFormPresenter >> title [

	^'Details for ', artifact name asString
]

{ #category : #updating }
PHCItemFormPresenter >> update [
	super update.
	artifact ifNotNil: [ 
		nameInput text: artifact name.
		descriptionInput text: artifact description.	 
	]
]
