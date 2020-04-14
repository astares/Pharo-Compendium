"
General settings for Compendium
"
Class {
	#name : #PHCCompendiumSettings,
	#superclass : #Object,
	#classVars : [
		'CacheCompendiumResults'
	],
	#category : #'Pharo-Compendium-Core-Settings'
}

{ #category : #accessing }
PHCCompendiumSettings class >> cacheCompendiumResults [

	^CacheCompendiumResults ifNil: [ CacheCompendiumResults := true ]
]

{ #category : #accessing }
PHCCompendiumSettings class >> cacheCompendiumResults: aBoolean [

	CacheCompendiumResults := aBoolean
]

{ #category : #settings }
PHCCompendiumSettings class >> catalogSettingsOn: aBuilder [  
	<systemsettings>  
	(aBuilder group: #compendium)
		label: 'Compendium';
		parent: #tools;
		description: 'All Compendium and Compendium Browser settings';
		with: [ 
			(aBuilder setting: #cacheCompendiumResults)
				label: 'Cache results';
				parent: #compendium;
				target: self;				
				description: 'Cache query results';
				default: true.
	 ]
]
