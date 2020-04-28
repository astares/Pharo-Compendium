Extension { #name : #PHCCatalogEntry }

{ #category : #'*Pharo-Compendium-Plugins-Catalog-UI' }
PHCCatalogEntry class >> contextCommands [

	^#(PHCBrowseItemURLCommand PHCInstallStableVersionCommand)
]

{ #category : #'*Pharo-Compendium-Plugins-Catalog-UI' }
PHCCatalogEntry class >> detailPresenters [ 

	^#(PHCCatalogItemFormPresenter)
]

{ #category : #'*Pharo-Compendium-Plugins-Catalog-UI' }
PHCCatalogEntry >> systemIcon [ 

	^PHCIconCache iconForClass: ((Smalltalk globals includesKey: self packageName asSymbol) 
											ifTrue: [ #PHCCatalogEntryLoaded ]
											ifFalse: [ #PHCCatalogEntry ])


]
