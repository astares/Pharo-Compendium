"
A reference to an online wallpaper file
"
Class {
	#name : #PHCWallpaper,
	#superclass : #Object,
	#traits : 'PHCTBrowseable + PHCTDescribed + PHCTNamed',
	#classTraits : 'PHCTBrowseable classTrait + PHCTDescribed classTrait + PHCTNamed classTrait',
	#instVars : [
		'imageURL',
		'size'
	],
	#category : #'Pharo-Compendium-Plugins-Wallpaper-Core-Model'
}

{ #category : #'as yet unclassified' }
PHCWallpaper class >> fromDictionary: aCollection [ 

	^ (self new)
			name: (aCollection at: #name ifAbsent: '');
			description: (aCollection at: #description ifAbsent: '');	
			url: (aCollection at: #url ifAbsent: '');		
			imageURL: (aCollection at: #image_url ifAbsent: '');		
			size: (aCollection at: #size ifAbsent: '');											
			yourself
]

{ #category : #'as yet unclassified' }
PHCWallpaper >> imageURL: aString [ 
	imageURL := aString
]
