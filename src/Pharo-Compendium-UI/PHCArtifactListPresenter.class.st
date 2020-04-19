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
PHCArtifactListPresenter >> fillTree [
	tree roots: PHCArtifactRegistry allRegistries.
	tree children: [:each | each children ].
	tree halt
]

{ #category : #initialization }
PHCArtifactListPresenter >> initializeWidgets [
	 
	self tree	
		beSingleSelection; 
		addColumn: (SpCompositeTableColumn new
				title: 'Classes';
				addColumn:
					(SpImageTableColumn new
						width: 20;
						evaluated: #systemIcon;
						yourself);
				addColumn:
					(SpStringTableColumn new
						evaluated: #name;
						yourself);
				yourself).
	
	self fillTree					
]

{ #category : #accessing }
PHCArtifactListPresenter >> tree [

	^tree ifNil: [ tree := self newTreeTable ]
]
