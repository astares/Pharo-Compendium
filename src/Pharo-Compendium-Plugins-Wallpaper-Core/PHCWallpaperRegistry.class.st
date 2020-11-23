"
The online wallpaper registry
"
Class {
	#name : #PHCWallpaperRegistry,
	#superclass : #PHCArtifactStore,
	#traits : 'PHCTBrowseable',
	#classTraits : 'PHCTBrowseable classTrait',
	#category : #'Pharo-Compendium-Plugins-Wallpaper-Core-Model'
}

{ #category : #'class initialization' }
PHCWallpaperRegistry class >> initialize [

	self registerInstance 
]

{ #category : #accessing }
PHCWallpaperRegistry >> artifacts [

	^#()
]

{ #category : #defaults }
PHCWallpaperRegistry >> defaultName [

	^ 'Wallpapers'
]

{ #category : #initialization }
PHCWallpaperRegistry >> initialize [
	"Initializes the receiver"
	
	super initialize.
	self url: 'https://raw.githubusercontent.com/pharo-compendium/pharo-registry-wallpapers/main/registry/wallpaper.json'.
	self description: 'Selected wallpapers to add as desktop background'
]
