"
A general presenter for details on Catalog items
"
Class {
	#name : #PHCCatalogItemFormPresenter,
	#superclass : #PHCItemFormPresenter,
	#instVars : [
		'contactInfo',
		'keywords',
		'packageName',
		'url'
	],
	#category : #'Pharo-Compendium-Plugins-Catalog-UI-Components'
}

{ #category : #specs }
PHCCatalogItemFormPresenter class >> defaultSpec [
	
	^ super defaultSpec
			add: #contactInfo withConstraints: [ :constraints | constraints height: self inputTextHeight ];
			add: #keywords withConstraints: [ :constraints | constraints height: self inputTextHeight ];
			add: #packageName withConstraints: [ :constraints | constraints height: self inputTextHeight ];		
			add: #url withConstraints: [ :constraints | constraints height: self inputTextHeight ];				 
			yourself
			
	 
]

{ #category : #'initialize - release' }
PHCCatalogItemFormPresenter >> initializePresenters [ 

	super initializePresenters.
	contactInfo := self instantiate: (SpLabelledPresenter label: 'Contact Info:' input: self newReadOnlyTextInput).
	keywords := self instantiate: (SpLabelledPresenter label: 'Keywords:' input: self newReadOnlyTextInput).
	packageName := self instantiate: (SpLabelledPresenter label: 'Package Name:' input: self newReadOnlyTextInput).
	url := self instantiate: (SpLabelledPresenter label: 'URL:' input: self newLink)
	
]

{ #category : #updating }
PHCCatalogItemFormPresenter >> update [
	super update.
	artifact ifNotNil: [ 
		contactInfo input text: artifact contactInfo.
		keywords input text: artifact keywords asString.
		packageName input text: artifact packageName.
		url input url: artifact url ]
]
