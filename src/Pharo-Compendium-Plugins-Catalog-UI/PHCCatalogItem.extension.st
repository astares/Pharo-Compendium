Extension { #name : #PHCCatalogItem }

{ #category : #'*Pharo-Compendium-Plugins-Catalog-UI' }
PHCCatalogItem class >> systemIcon [
	
	^PHCIconCache iconForClass: (self isAbstract 
											ifTrue: [ #PHCPharoCatalog ]
											ifFalse: [ self name asSymbol ])
]
