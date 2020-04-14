"
Main UI window for the library browser
"
Class {
	#name : #PPLCompendiumBrowser,
	#superclass : #SpPresenter,
	#category : #'Pharo-Compendium-UI-Windows'
}

{ #category : #specs }
PPLCompendiumBrowser class >> defaultSpec [
	^ SpBoxLayout newVertical  
]

{ #category : #'world menu' }
PPLCompendiumBrowser class >> menuCommandOn: aBuilder [ 
	<worldMenu> 
	(aBuilder item: #'Compendium Browser')
		parent: #'Tools';
		help: 'Pharo Compendium';
		action: [ self open ]; 
		order: 200;
		iconName: #catalogIcon. 
	
]

{ #category : #showing }
PPLCompendiumBrowser class >> open [
	<script>

	self new openWithSpec
]

{ #category : #defaults }
PPLCompendiumBrowser >> initialExtent [ 
	^ 700 @ 500
]

{ #category : #defaults }
PPLCompendiumBrowser >> title [ 

   ^'Pharo Compendium'
]
