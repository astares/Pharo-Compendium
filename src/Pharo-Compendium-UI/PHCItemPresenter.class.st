"
A presenter for available artifact
"
Class {
	#name : #PHCItemPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'tree',
		'details'
	],
	#category : #'Pharo-Compendium-UI-Components'
}

{ #category : #commands }
PHCItemPresenter class >> buildCommandsGroupWith: presenterIntance forRoot: rootCommandGroup [
	rootCommandGroup		 
		register: (self buildContextualMenuGroupWith: presenterIntance)
]

{ #category : #commands }
PHCItemPresenter class >> buildContextualMenuGroupWith: presenterInstance [
	^ (CmCommandGroup named: 'Context Menu') asSpecGroup
		register: (self buildHandlingGroupWith: presenterInstance);		
		yourself
]

{ #category : #commands }
PHCItemPresenter class >> buildHandlingGroupWith: presenterInstance [
	^ (CmCommandGroup named: 'Handling') asSpecGroup
			description: 'Commands related to artifact handling.';
			register: (PHCBrowseItemURLCommand forSpecContext: presenterInstance);
			beDisplayedAsGroup;
			yourself
]

{ #category : #specs }
PHCItemPresenter class >> defaultSpec [

	^ SpPanedLayout newVertical		
		add: #tree;		
		add: #details;
		yourself
]

{ #category : #showing }
PHCItemPresenter class >> open [
	<script>
	self new openWithSpec 
]

{ #category : #accessing }
PHCItemPresenter >> details [
	^ details
]

{ #category : #accessing }
PHCItemPresenter >> details: anObject [
	details := anObject
]

{ #category : #'private - utilities' }
PHCItemPresenter >> fillTree [
	tree roots: PHCArtifactRegistry allRegistries.
	tree children: [:each | each children ].
	 
]

{ #category : #'private - initialization' }
PHCItemPresenter >> initializeDetails [
	 
	 details := self instantiate: PHCItemTabbedDefailsPresenter
]

{ #category : #initialization }
PHCItemPresenter >> initializePresenters [
	self 
		initializeDetails;
		initializeTree
		
]

{ #category : #'private - initialization' }
PHCItemPresenter >> initializeTree [
	 
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
PHCItemPresenter >> selectedItem [

	^self tree selectedItem 
]

{ #category : #accessing }
PHCItemPresenter >> tree [

	^tree ifNil: [ tree := self newTreeTable ]
]
