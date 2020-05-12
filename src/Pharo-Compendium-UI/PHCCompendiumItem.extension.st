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
PHCCompendiumItem class >> spotterActivationCommand [
	"Return the command class used when the item is activated in Spotter"
	
	^self subclassResponsibility 
]

{ #category : #'*Pharo-Compendium-UI' }
PHCCompendiumItem >> systemIcon [ 
	^self class systemIcon
]
