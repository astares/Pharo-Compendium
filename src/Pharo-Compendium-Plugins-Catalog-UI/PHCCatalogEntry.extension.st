Extension { #name : #PHCCatalogEntry }

{ #category : #'*Pharo-Compendium-Plugins-Catalog-UI' }
PHCCatalogEntry class >> contextCommands [

	^#(PHCBrowseItemURLCommand PHCInstallStableVersionCommand)
]

{ #category : #'*Pharo-Compendium-Plugins-Catalog-UI' }
PHCCatalogEntry class >> detailPresenters [ 

	^#(PHCCatalogItemFormPresenter)
]
