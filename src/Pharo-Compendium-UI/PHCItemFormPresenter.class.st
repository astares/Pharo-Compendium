"
Common superclass for form based detail presenters
"
Class {
	#name : #PHCItemFormPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'artifact',
		'name',
		'description'
	],
	#category : #'Pharo-Compendium-UI-Components'
}

{ #category : #specs }
PHCItemFormPresenter class >> defaultSpec [
	
	^ SpBoxLayout newVertical
		 	add: #name withConstraints: [ :constraints | constraints height: self inputTextHeight ];
			add: #description withConstraints: [ :constraints | constraints height: self inputTextHeight ];			 
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
 	super initializePresenters.
	name := self instantiate: (SpLabelledPresenter label: 'Name' input: self newTextInput).
	description := self instantiate: (SpLabelledPresenter label: 'Description' input: self newTextInput). 
	 
	
]

{ #category : #accessing }
PHCItemFormPresenter >> title [
	^'Details', (artifact ifNil: '' ifNotNil: [ ' for ', artifact name asString ])

]

{ #category : #updating }
PHCItemFormPresenter >> update [
	super update.
	artifact ifNotNil: [ 
		name input text: artifact name.
		description input text: artifact description.	 
	]
]
