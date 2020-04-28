Extension { #name : #PHCPharoCatalog }

{ #category : #'*Pharo-Compendium-Plugins-Catalog-UI' }
PHCPharoCatalog class >> contextCommands [

	^#(PHCBrowseItemURLCommand)
]

{ #category : #'*Pharo-Compendium-Plugins-Catalog-UI' }
PHCPharoCatalog class >> systemIcon [
	
	^PHCIconCache iconForClass: self name asSymbol
]
