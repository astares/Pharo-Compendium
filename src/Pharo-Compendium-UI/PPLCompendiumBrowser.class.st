"
Main UI window for the library browser
"
Class {
	#name : #PPLCompendiumBrowser,
	#superclass : #SpPresenter,
	#instVars : [
		'menu',
		'statusBar',
		'toolBar'
	],
	#category : #'Pharo-Compendium-UI-Windows'
}

{ #category : #specs }
PPLCompendiumBrowser class >> defaultSpec [
	"Return a default spec for the UI layout"
	
	^ SpBoxLayout newVertical  
]

{ #category : #accessing }
PPLCompendiumBrowser class >> icon [
	"Return an icon suitable for representing the receiver class and instances"
	
	^self iconNamed: #catalogIcon
]

{ #category : #'world menu' }
PPLCompendiumBrowser class >> menuCommandOn: aBuilder [
	"Register within the world menu"
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

{ #category : #accessing }
PPLCompendiumBrowser class >> systemIcon [
	"Return an icon used to display the receiver class within a system browser"
	
	^self icon
]

{ #category : #accessing }
PPLCompendiumBrowser class >> taskbarIcon [
	"Return an icon used to display the receivers instances in the Pharo taskbar"

	^self icon
]

{ #category : #defaults }
PPLCompendiumBrowser >> aboutText [

	^'PHARO COMPENDIUM

(c) 2020 by T.Bergmann, astares.com'
]

{ #category : #'private - building - menues' }
PPLCompendiumBrowser >> buildCompendiumMenu [

	^self newMenu
		addItem: [ :item | item name: 'Settings'; action: [ self openSettings ] ];	 
		yourself
]

{ #category : #'private - building - menues' }
PPLCompendiumBrowser >> buildHelpMenu [

	^ self newMenu
		addItem: [ :item | item name: 'Help'; action: [ 	self openHelp ] ];
		addItem: [ :item | item name: 'About'; action: [ 	self openAbout ] ];	 
		yourself
]

{ #category : #'private - building' }
PPLCompendiumBrowser >> buildMenuBar [
	^ self newMenuBar
		addGroup: [ :group | 
			group addItem: [ :item | 
					item
						name: 'Compendium';
						subMenu: self buildCompendiumMenu ].
			group addItem: [ :item | 
					item
						name: 'Help';
						subMenu: self buildHelpMenu ] ]
]

{ #category : #'private - building' }
PPLCompendiumBrowser >> buildStatusBar [

	^ SpStatusBarPresenter new
]

{ #category : #defaults }
PPLCompendiumBrowser >> initialExtent [
	"Return an initial extent when the receiver opens standalone"
	
	^ 700 @ 500
]

{ #category : #defaults }
PPLCompendiumBrowser >> initializeWindow: aWindowPresenter [
	"I'm called whenever the component will be displayed in a window (or dialog). 
	 This is usually attained sending #openWithSpec or #openDialogWithSpec."
	
	super initializeWindow: aWindowPresenter.
	aWindowPresenter
		menu: (menu := self buildMenuBar);
		"toolBar: (toolBar := self buildToolBar);"
		statusBar: (statusBar := self buildStatusBar).

	self statusBar pushMessage: 'Ready'	
]

{ #category : #accessing }
PPLCompendiumBrowser >> menu [
	^ menu
]

{ #category : #accessing }
PPLCompendiumBrowser >> menu: anObject [
	^ menu := anObject
]

{ #category : #actions }
PPLCompendiumBrowser >> openAbout [
	"Give some infos on the receiver"
	
	| dialog |
	dialog := AboutDialogWindow new entryText: self aboutText.
	dialog open
]

{ #category : #actions }
PPLCompendiumBrowser >> openHelp [
	"Open the help system"
	
	PHCCompendiumHelp open
]

{ #category : #actions }
PPLCompendiumBrowser >> openSettings [ 

	PHCCompendiumSettings openSettings 
]

{ #category : #accessing }
PPLCompendiumBrowser >> statusBar [
	^ statusBar
]

{ #category : #accessing }
PPLCompendiumBrowser >> statusBar: anObject [
	^ statusBar := anObject
]

{ #category : #defaults }
PPLCompendiumBrowser >> title [
	"Return a title for the receivers standalone window"

   ^'Pharo Compendium'
]

{ #category : #accessing }
PPLCompendiumBrowser >> toolBar [
	^ toolBar
]

{ #category : #accessing }
PPLCompendiumBrowser >> toolBar: anObject [
	toolBar := anObject
]
