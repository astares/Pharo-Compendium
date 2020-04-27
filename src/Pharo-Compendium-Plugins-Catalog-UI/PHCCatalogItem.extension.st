Extension { #name : #PHCCatalogItem }

{ #category : #'*Pharo-Compendium-Plugins-Catalog-UI' }
PHCCatalogItem class >> systemIcon [
	
	^PHCIconCache iconForClass: self name asSymbol
]
