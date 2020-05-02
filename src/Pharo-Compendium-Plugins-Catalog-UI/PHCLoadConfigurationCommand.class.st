"
Load a configuration
"
Class {
	#name : #PHCLoadConfigurationCommand,
	#superclass : #PHCCommand,
	#category : #'Pharo-Compendium-Plugins-Catalog-UI-Commands'
}

{ #category : #accessing }
PHCLoadConfigurationCommand class >> defaultIconName [

	^#configIcon
]

{ #category : #accessing }
PHCLoadConfigurationCommand class >> defaultName [

	^'Load configuration (do not install project)'
]

{ #category : #executing }
PHCLoadConfigurationCommand >> execute [

	| catalogEntry |
	catalogEntry := self context selectedItem.
	
	[ 
		Gofer it 
		url: catalogEntry url;
		configurationOf: catalogEntry name;
		load.
		
		self inform: catalogEntry name, ' configuration loaded' ] 
	on: Error do: [ :e | 
		e traceCr.
		self inform: 'There was an error while trying to load ', catalogEntry name, '. Loading was cancelled.' ]
]
