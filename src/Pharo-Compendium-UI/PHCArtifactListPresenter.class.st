"
A list presenting the artifacts
"
Class {
	#name : #PHCArtifactListPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'tree'
	],
	#category : #'Pharo-Compendium-UI-Components'
}

{ #category : #specs }
PHCArtifactListPresenter class >> defaultSpec [

	^ SpPanedLayout newVertical		
		add: #tree;		
		yourself
]

{ #category : #showing }
PHCArtifactListPresenter class >> open [
	<script>
	self new openWithSpec 
]

{ #category : #initialization }
PHCArtifactListPresenter >> initializeWidgets [
	 
	self tree	
		beSingleSelection; 
		addColumn: (SpCompositeTableColumn new
				title: 'Name';
				addColumn:
					(SpImageTableColumn new
						width: 20;
						evaluated: #icon;
						yourself))
]

{ #category : #accessing }
PHCArtifactListPresenter >> tree [

	^tree ifNil: [ tree := self newTreeTable ]
]
