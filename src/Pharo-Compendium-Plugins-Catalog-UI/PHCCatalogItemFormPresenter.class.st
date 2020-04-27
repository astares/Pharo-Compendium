"
A general presenter for details on Catalog items
"
Class {
	#name : #PHCCatalogItemFormPresenter,
	#superclass : #PHCItemFormPresenter,
	#instVars : [
		'contactInfoLabel',
		'contactInfoInput',
		'keywordsLabel',
		'keywordsInput',
		'packageNameLabel',
		'packageNameInput',
		'urlLabel',
		'urlInput'
	],
	#category : #'Pharo-Compendium-Plugins-Catalog-UI-Components'
}

{ #category : #specs }
PHCCatalogItemFormPresenter class >> defaultSpec [
	
	^ SpBoxLayout newVertical
		add:
			(SpGridLayout new
				add: #nameLabel at: 1 @ 1; add: #nameInput at: 2 @ 1;
				add: #descriptionLabel at: 1 @ 2; add: #descriptionInput at: 2 @ 2;
				add: #contactInfoLabel at: 1 @ 3; add: #contactInfoInput at: 2 @ 3;		
				add: #keywordsLabel at: 1 @ 4; add: #keywordsInput at: 2 @ 4;				
				add: #packageNameLabel at: 1 @ 5; add: #packageNameInput at: 2 @ 5;		
				add: #urlLabel at: 1 @ 6; add: #urlInput at: 2 @ 6
			);
		yourself
]

{ #category : #'initialize - release' }
PHCCatalogItemFormPresenter >> initializePresenters [ 

	super initializePresenters.
	contactInfoLabel := self newLabel label: 'Contact Info:'.
	contactInfoInput := self newTextInput.
	
	keywordsLabel := self newLabel label: 'Keywords:'.
	keywordsInput := self newTextInput.
	
	packageNameLabel := self newLabel label: 'Package Name:'.
	packageNameInput := self newTextInput.
	
	urlLabel := self newLabel label: 'URL:'.
	urlInput := self newLink.
	
]

{ #category : #updating }
PHCCatalogItemFormPresenter >> update [
	super update.
	artifact ifNotNil: [ 
		contactInfoInput text: artifact contactInfo.
		keywordsInput text: artifact keywords asString.
		packageNameInput text: artifact packageName.
		urlInput url: artifact url ]
]
