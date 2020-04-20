"
A list presenting the artifacts
"
Class {
	#name : #PHCArtifactPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'tree'
	],
	#category : #'Pharo-Compendium-UI-Components'
}

{ #category : #specs }
PHCArtifactPresenter class >> defaultSpec [

	^ SpPanedLayout newVertical		
		add: #tree;		
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

{ #category : #initialization }
PHCArtifactPresenter >> contextMenu [ 
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
PHCArtifactPresenter >> fillTree [
	tree roots: PHCArtifactRegistry allRegistries.
	tree children: [:each | each children ].
	 
]

{ #category : #initialization }
PHCArtifactPresenter >> initializeWidgets [
	 
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
PHCArtifactPresenter >> inspectArtifact [

	self tree selectedItem ifNotNil: [:item | item inspect ]
		
]

{ #category : #accessing }
PHCArtifactPresenter >> tree [

	^tree ifNil: [ tree := self newTreeTable ]
]
