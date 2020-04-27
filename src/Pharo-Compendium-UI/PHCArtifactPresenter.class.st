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
PHCArtifactPresenter class >> buildContextualMenuGroupWith: presenterIntance [
	^ (CmCommandGroup named: 'Context Menu') asSpecGroup
		register: (self buildHandlingGroupWith: presenterIntance);		
		yourself
]

{ #category : #commands }
PHCArtifactPresenter class >> buildHandlingGroupWith: presenterIntance [
	^ (CmCommandGroup named: 'Handling') asSpecGroup
		description: 'Commands related to artifact handling.';
		register: PHCBrowseArtifactCommand forSpec;
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

{ #category : #actions }
PHCArtifactPresenter >> browseArtifact [

	self tree selectedItem ifNotNil: [:item | WebBrowser openOn: item url ]
		
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
		contextMenu: self treeContextMenu.		
				
	tree whenSelectionChangedDo: [:sel | 
		
	 	self details artifact: sel selectedItem.
	]. 				
	
	self fillTree					
]

{ #category : #actions }
PHCArtifactPresenter >> inspectArtifact [

	self tree selectedItem ifNotNil: [:item | item inspect ]
		
]

{ #category : #accessing }
PHCArtifactPresenter >> tree [

	^tree ifNil: [ tree := self newTreeTable ]
]

{ #category : #'private - accessing' }
PHCArtifactPresenter >> treeContextMenu [ 
	^(SpMenuPresenter new
		addGroup: [ :group | group
			addItem: [ :item | item name: 'Browse';  action: [ self browseArtifact ]]
		];			
		addGroup: [ :group | group
			addItem: [ :item | item name: 'Inspect';  action: [ self inspectArtifact ]]
		];						
		yourself).
]
