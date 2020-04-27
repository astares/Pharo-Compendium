"
A list presenting the artifacts
"
Class {
	#name : #PHCArtifactPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'tree',
		'details'
	],
	#category : #'Pharo-Compendium-UI-Components'
}

{ #category : #commands }
PHCArtifactPresenter class >> buildCommandsGroupWith: presenterIntance forRoot: rootCommandGroup [
	rootCommandGroup		 
		register: (self buildContextualMenuGroupWith: presenterIntance)
]

{ #category : #commands }
PHCArtifactPresenter class >> buildContextualMenuGroupWith: presenterInstance [
	^ (CmCommandGroup named: 'Context Menu') asSpecGroup
		register: (self buildHandlingGroupWith: presenterInstance);		
		yourself
]

{ #category : #commands }
PHCArtifactPresenter class >> buildHandlingGroupWith: presenterInstance [
	^ (CmCommandGroup named: 'Handling') asSpecGroup
			description: 'Commands related to artifact handling.';
			register: (PHCBrowseArtifactCommand forSpecContext: presenterInstance);
			beDisplayedAsGroup;
			yourself
]

{ #category : #specs }
PHCArtifactPresenter class >> defaultSpec [

	^ SpPanedLayout newVertical		
		add: #tree;		
		add: #details;
		yourself
]

{ #category : #showing }
PHCArtifactPresenter class >> open [
	<script>
	self new openWithSpec 
]

{ #category : #accessing }
PHCArtifactPresenter >> details [
	^ details
]

{ #category : #accessing }
PHCArtifactPresenter >> details: anObject [
	details := anObject
]

{ #category : #'private - utilities' }
PHCArtifactPresenter >> fillTree [
	tree roots: PHCArtifactRegistry allRegistries.
	tree children: [:each | each children ].
	 
]

{ #category : #'private - initialization' }
PHCArtifactPresenter >> initializeDetails [
	 
	 details := self instantiate: PHCArtifactDetailsPresenter
]

{ #category : #initialization }
PHCArtifactPresenter >> initializePresenters [
	self 
		initializeDetails;
		initializeTree
		
]

{ #category : #'private - initialization' }
PHCArtifactPresenter >> initializeTree [
	 
	self tree	
		beSingleSelection; 
		addColumn: (SpCompositeTableColumn new
				title: 'Artifacts';
				addColumn:
					(SpImageTableColumn new
						width: 20;
						evaluated: #systemIcon;
						yourself);
				addColumn:
					(SpStringTableColumn new
						evaluated: #name;
						yourself);
				yourself);			
		contextMenuFromCommandsGroup: [ self rootCommandsGroup / 'Context Menu' ].					
		"contextMenu: self treeContextMenu."		
				
	tree whenSelectionChangedDo: [:sel | 
		
	 	self details artifact: sel selectedItem.
	]. 				
	
	self fillTree					
]

{ #category : #accessing }
PHCArtifactPresenter >> selectedArtifact [

	^self tree selectedItem 
]

{ #category : #accessing }
PHCArtifactPresenter >> tree [

	^tree ifNil: [ tree := self newTreeTable ]
]
