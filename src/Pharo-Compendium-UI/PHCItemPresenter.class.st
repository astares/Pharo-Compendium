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
PHCItemPresenter class >> buildCommandsGroupWith: presenterInstance forRoot: rootCommandGroup [
	rootCommandGroup		 
		register: (self buildContextualMenuGroupWith: presenterInstance)
]

{ #category : #commands }
PHCItemPresenter class >> buildContextualMenuGroupWith: presenterInstance [
	^ (CmCommandGroup named: 'Context Menu') asSpecGroup		 
		register: (self buildItemGroupWith: presenterInstance);		
		yourself
]

{ #category : #commands }
PHCItemPresenter class >> buildItemGroupWith: presenterInstance [
	| group cmdClass |
	presenterInstance selectedItem ifNil: [ ^self ].
	group := (CmCommandGroup named: 'Item') asSpecGroup.
	group description: 'Commands related to item handling.'.
	
	presenterInstance selectedItem class contextCommands do: [:cmdClassSymbol |
		cmdClass := cmdClassSymbol asClassInEnvironment: self class environment.
		group register: (cmdClass forSpecContext: presenterInstance)	
	].
	
	^group 
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
	tree roots: PHCArtifactStore allArtefactStores.
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
