Extension { #name : #PHCCompendiumItem }

{ #category : #'*Pharo-Compendium-UI' }
PHCCompendiumItem >> children [

	^#()
]

{ #category : #'*Pharo-Compendium-UI' }
PHCCompendiumItem class >> contextCommands [

	^#()
]

{ #category : #'*Pharo-Compendium-UI' }
PHCCompendiumItem class >> detailPresenters [

	^#( PHCItemFormPresenter )
]

{ #category : #'*Pharo-Compendium-UI' }
PHCCompendiumItem >> icon [

	^nil
]

{ #category : #'*Pharo-Compendium-UI' }
PHCCompendiumItem >> systemIcon [ 
	^self class systemIcon
]
