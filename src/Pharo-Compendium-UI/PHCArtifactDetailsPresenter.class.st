"
Present details on the selected artifact
"
Class {
	#name : #PHCArtifactDetailsPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'notebook',
		'artifact'
	],
	#category : #'Pharo-Compendium-UI-Components'
}

{ #category : #specs }
PHCArtifactDetailsPresenter class >> defaultSpec [

	^ SpBoxLayout newHorizontal	 
		add: #notebook;
		yourself
]

{ #category : #showing }
PHCArtifactDetailsPresenter class >> open [ 
	<script>
	(self new)
		openWithSpec 
]

{ #category : #showing }
PHCArtifactDetailsPresenter class >> openWithArtifact [
	<script>
	(self new)
		artifact: (PHCArtifact new name: 'HelloWorld'; description: 'Sampe artifact'; yourself )
		openWithSpec 
]

{ #category : #accessing }
PHCArtifactDetailsPresenter >> artifact [
	^ artifact
]

{ #category : #accessing }
PHCArtifactDetailsPresenter >> artifact: anObject [
	artifact := anObject.
	  self createPages 
]

{ #category : #accessing }
PHCArtifactDetailsPresenter >> createPages [
	| page general |
	self notebook removeAll.
	artifact ifNil: [ ^self ].
	general := self instantiate: PHCArtifactDetailGeneralFormPresenter.
	general artifact: artifact.
	page := SpNotebookPage
					title: 'Details for ', artifact name asString 
					icon: (PHCIconCache iconForClass: #PHCCompendiumBrowser)
					provider: general.
	notebook addPage: page.
	notebook selectPage: page
	
]

{ #category : #accessing }
PHCArtifactDetailsPresenter >> notebook [
	^notebook ifNil: [ notebook := self newNotebook ]
]

{ #category : #accessing }
PHCArtifactDetailsPresenter >> notebook: anObject [
	notebook := anObject
]
