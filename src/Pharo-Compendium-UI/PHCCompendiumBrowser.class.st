"
Main UI window for the library browser
"
Class {
	#name : #PHCCompendiumBrowser,
	#superclass : #SpPresenter,
	#instVars : [
		'menu',
		'statusBar',
		'toolBar',
		'contentPresenter'
	],
	#category : #'Pharo-Compendium-UI-Windows'
}

{ #category : #specs }
PHCCompendiumBrowser class >> defaultSpec [
	"Return a default spec for the UI layout"
	
	^ SpBoxLayout newVertical  
		add: #contentPresenter;
		yourself
]

{ #category : #accessing }
PHCCompendiumBrowser class >> icon [
	"Return an icon suitable for representing the receiver class and instances"
	
	^self iconNamed: #catalogIcon
]

{ #category : #'world menu' }
PHCCompendiumBrowser class >> menuCommandOn: aBuilder [
	"Register within the world menu"
	<worldMenu> 
	
	(aBuilder item: #'Compendium Browser')
		parent: #'Tools';
		help: 'Pharo Compendium';
		action: [ self open ]; 
		order: 200;
		icon: self systemIcon
	
]

{ #category : #showing }
PHCCompendiumBrowser class >> open [
	<script>

	self new openWithSpec
]

{ #category : #accessing }
PHCCompendiumBrowser class >> systemIcon [ 
	^PHCIconCache iconForClass: self name asSymbol
]

{ #category : #accessing }
PHCCompendiumBrowser class >> taskbarIcon [
	"Return an icon used to display the receivers instances in the Pharo taskbar"

	^self icon
]

{ #category : #defaults }
PHCCompendiumBrowser >> aboutText [

	^'PHARO COMPENDIUM

(c) 2020 by T.Bergmann, astares.com'
]

{ #category : #'private - building - menues' }
PHCCompendiumBrowser >> buildCompendiumMenu [

	^self newMenu
		addItem: [ :item | item name: 'Settings...'; action: [ self openSettings ] ];	 
		yourself
]

{ #category : #'private - building - menues' }
PHCCompendiumBrowser >> buildHelpMenu [

	^ self newMenu
		addGroup: [:group | group addItem: [:item | item name: 'Help'; action: [ self openHelp ]]];
		addGroup: [:group | group addItem: [:item | item name: 'About'; action: [ self openAbout ]]];
		yourself
]

{ #category : #'private - building' }
PHCCompendiumBrowser >> buildMenuBar [
	^ self newMenuBar
		addGroup: [ :group | 
			group addItem: [ :item | 
					item
						name: 'General';
						subMenu: self buildCompendiumMenu ].
			group addItem: [ :item | 
					item
						name: 'Help';
						subMenu: self buildHelpMenu ] ]
]

{ #category : #'private - building - toolbar' }
PHCCompendiumBrowser >> buildSettingsToolBarItem [
		
	^ SpToolBarButton new
		label: 'Settings';
		icon: (SettingBrowser iconNamed: #smallConfigurationIcon);
		help: 'Open settings';
		action: [ self openSettings ];
		yourself
]

{ #category : #'private - building' }
PHCCompendiumBrowser >> buildStatusBar [

	^ SpStatusBarPresenter new
]

{ #category : #'private - building' }
PHCCompendiumBrowser >> buildToolBar [
	
	^ self newToolBar 
		addItemRight: self buildSettingsToolBarItem;		 			
		yourself
]

{ #category : #defaults }
PHCCompendiumBrowser >> initialExtent [
	"Return an initial extent when the receiver opens standalone"
	
	^ 700 @ 500
]

{ #category : #initialization }
PHCCompendiumBrowser >> initializeWidgets [ 

	contentPresenter := self instantiate: PHCArtifactListPresenter
]

{ #category : #defaults }
PHCCompendiumBrowser >> initializeWindow: aWindowPresenter [
	"I'm called whenever the component will be displayed in a window (or dialog). 
	 This is usually attained sending #openWithSpec or #openDialogWithSpec."
	
	super initializeWindow: aWindowPresenter.
	aWindowPresenter
		menu: (menu := self buildMenuBar);
		toolBar: (toolBar := self buildToolBar);
		statusBar: (statusBar := self buildStatusBar).

	self statusBar pushMessage: 'Ready'	
]

{ #category : #accessing }
PHCCompendiumBrowser >> menu [
	^ menu
]

{ #category : #accessing }
PHCCompendiumBrowser >> menu: anObject [
	^ menu := anObject
]

{ #category : #actions }
PHCCompendiumBrowser >> openAbout [
	"Give some infos on the receiver"
	
	| dialog |
	dialog := AboutDialogWindow new entryText: self aboutText.
	dialog open
]

{ #category : #actions }
PHCCompendiumBrowser >> openHelp [
	"Open the help system"
	
	PHCCompendiumHelp open
]

{ #category : #actions }
PHCCompendiumBrowser >> openSettings [ 

	PHCCompendiumSettings openSettings 
]

{ #category : #accessing }
PHCCompendiumBrowser >> statusBar [
	^ statusBar
]

{ #category : #accessing }
PHCCompendiumBrowser >> statusBar: anObject [
	^ statusBar := anObject
]

{ #category : #accessing }
PHCCompendiumBrowser >> taskbarIcon [

	^self class systemIcon 
]

{ #category : #defaults }
PHCCompendiumBrowser >> title [
	"Return a title for the receivers standalone window"

   ^'Pharo Compendium'
]

{ #category : #accessing }
PHCCompendiumBrowser >> toolBar [
	^ toolBar
]

{ #category : #accessing }
PHCCompendiumBrowser >> toolBar: anObject [
	toolBar := anObject
]
