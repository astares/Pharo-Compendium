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

{ #category : #actions }
PHCArtifactListPresenter >> browseArtifact [

	self tree selectedItem ifNotNil: [:item | WebBrowser openOn: item url ]
		
]

{ #category : #initialization }
PHCArtifactListPresenter >> contextMenu [ 
	^(SpMenuPresenter new
		addGroup: [ :group | group
			addItem: [ :item | item name: 'Browse';  action: [ self browseArtifact ]]
		];			
		addGroup: [ :group | group
			addItem: [ :item | item name: 'Inspect';  action: [ self inspectArtifact ]]
		];						
		yourself).
]

{ #category : #initialization }
PHCArtifactListPresenter >> fillTree [
	tree roots: PHCArtifactRegistry allRegistries.
	tree children: [:each | each children ].
	 
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
				yourself);			
		contextMenu: self contextMenu.		
	
	self fillTree					
]

{ #category : #actions }
PHCArtifactListPresenter >> inspectArtifact [

	self tree selectedItem ifNotNil: [:item | item inspect ]
		
]

{ #category : #accessing }
PHCArtifactListPresenter >> tree [

	^tree ifNil: [ tree := self newTreeTable ]
]
