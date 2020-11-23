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
