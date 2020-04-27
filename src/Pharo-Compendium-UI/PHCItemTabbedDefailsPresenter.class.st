"
Present details on the selected artifact
"
Class {
	#name : #PHCItemTabbedDefailsPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'notebook',
		'artifact'
	],
	#category : #'Pharo-Compendium-UI-Components'
}

{ #category : #specs }
PHCItemTabbedDefailsPresenter class >> defaultSpec [

	^ SpBoxLayout newHorizontal	 
		add: #notebook;
		yourself
]

{ #category : #showing }
PHCItemTabbedDefailsPresenter class >> open [
	<script>
	
	(self new)		 
		openWithSpec 
]

{ #category : #showing }
PHCItemTabbedDefailsPresenter class >> openWithArtifact [
	<script>
	(self new)
		artifact: (PHCArtifact new name: 'HelloWorld'; description: 'Sampe artifact'; yourself );
		openWithSpec 
]

{ #category : #accessing }
PHCItemTabbedDefailsPresenter >> artifact [
	^ artifact
]

{ #category : #accessing }
PHCItemTabbedDefailsPresenter >> artifact: anObject [
	artifact := anObject.
	self createPages 
]

{ #category : #accessing }
PHCItemTabbedDefailsPresenter >> createPages [
	| page general |
	self notebook removeAll.
	artifact ifNil: [ ^self ].
	general := self instantiate: PHCItemFormPresenter.
	general artifact: artifact.
	page := SpNotebookPage
					title: 'Details for ', artifact name asString 
					icon: (PHCIconCache iconForClass: #PHCCompendiumBrowser)
					provider: general.
	notebook addPage: page.
	notebook selectPage: page
	
]

{ #category : #initialization }
PHCItemTabbedDefailsPresenter >> initializePresenters [
	self notebook
]

{ #category : #accessing }
PHCItemTabbedDefailsPresenter >> notebook [
	^notebook ifNil: [ notebook := self newNotebook ]
]

{ #category : #accessing }
PHCItemTabbedDefailsPresenter >> notebook: anObject [
	notebook := anObject
]
