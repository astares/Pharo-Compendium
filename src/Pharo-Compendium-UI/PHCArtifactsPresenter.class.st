"
A presenter for available artifact
"
Class {
	#name : #PHCArtifactsPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'tree',
		'details'
	],
	#category : #'Pharo-Compendium-UI-Components'
}

{ #category : #commands }
PHCArtifactsPresenter class >> buildCommandsGroupWith: presenterIntance forRoot: rootCommandGroup [
	rootCommandGroup		 
		register: (self buildContextualMenuGroupWith: presenterIntance)
]

{ #category : #commands }
PHCArtifactsPresenter class >> buildContextualMenuGroupWith: presenterInstance [
	^ (CmCommandGroup named: 'Context Menu') asSpecGroup
		register: (self buildHandlingGroupWith: presenterInstance);		
		yourself
]

{ #category : #commands }
PHCArtifactsPresenter class >> buildHandlingGroupWith: presenterInstance [
	^ (CmCommandGroup named: 'Handling') asSpecGroup
			description: 'Commands related to artifact handling.';
			register: (PHCBrowseArtifactCommand forSpecContext: presenterInstance);
			beDisplayedAsGroup;
			yourself
]

{ #category : #specs }
PHCArtifactsPresenter class >> defaultSpec [

	^ SpPanedLayout newVertical		
		add: #tree;		
		add: #details;
		yourself
]

{ #category : #showing }
PHCArtifactsPresenter class >> open [
	<script>
	self new openWithSpec 
]

{ #category : #accessing }
PHCArtifactsPresenter >> details [
	^ details
]

{ #category : #accessing }
PHCArtifactsPresenter >> details: anObject [
	details := anObject
]

{ #category : #'private - utilities' }
PHCArtifactsPresenter >> fillTree [
	tree roots: PHCArtifactRegistry allRegistries.
	tree children: [:each | each children ].
	 
]

{ #category : #'private - initialization' }
PHCArtifactsPresenter >> initializeDetails [
	 
	 details := self instantiate: PHCArtifactTabbedDefailsPresenter
]

{ #category : #initialization }
PHCArtifactsPresenter >> initializePresenters [
	self 
		initializeDetails;
		initializeTree
		
]

{ #category : #'private - initialization' }
PHCArtifactsPresenter >> initializeTree [
	 
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
PHCArtifactsPresenter >> selectedArtifact [

	^self tree selectedItem 
]

{ #category : #accessing }
PHCArtifactsPresenter >> tree [

	^tree ifNil: [ tree := self newTreeTable ]
]
