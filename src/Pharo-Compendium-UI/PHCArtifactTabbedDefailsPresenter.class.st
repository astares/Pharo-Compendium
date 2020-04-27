"
Present details on the selected artifact
"
Class {
	#name : #PHCArtifactTabbedDefailsPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'notebook',
		'artifact'
	],
	#category : #'Pharo-Compendium-UI-Components'
}

{ #category : #specs }
PHCArtifactTabbedDefailsPresenter class >> defaultSpec [

	^ SpBoxLayout newHorizontal	 
		add: #notebook;
		yourself
]

{ #category : #showing }
PHCArtifactTabbedDefailsPresenter class >> open [
	<script>
	
	(self new)		 
		openWithSpec 
]

{ #category : #showing }
PHCArtifactTabbedDefailsPresenter class >> openWithArtifact [
	<script>
	(self new)
		artifact: (PHCArtifact new name: 'HelloWorld'; description: 'Sampe artifact'; yourself );
		openWithSpec 
]

{ #category : #accessing }
PHCArtifactTabbedDefailsPresenter >> artifact [
	^ artifact
]

{ #category : #accessing }
PHCArtifactTabbedDefailsPresenter >> artifact: anObject [
	artifact := anObject.
	self createPages 
]

{ #category : #accessing }
PHCArtifactTabbedDefailsPresenter >> createPages [
	| page general |
	self notebook removeAll.
	artifact ifNil: [ ^self ].
	general := self instantiate: PHCArtifactFormPresenter.
	general artifact: artifact.
	page := SpNotebookPage
					title: 'Details for ', artifact name asString 
					icon: (PHCIconCache iconForClass: #PHCCompendiumBrowser)
					provider: general.
	notebook addPage: page.
	notebook selectPage: page
	
]

{ #category : #initialization }
PHCArtifactTabbedDefailsPresenter >> initializePresenters [
	self notebook
]

{ #category : #accessing }
PHCArtifactTabbedDefailsPresenter >> notebook [
	^notebook ifNil: [ notebook := self newNotebook ]
]

{ #category : #accessing }
PHCArtifactTabbedDefailsPresenter >> notebook: anObject [
	notebook := anObject
]
