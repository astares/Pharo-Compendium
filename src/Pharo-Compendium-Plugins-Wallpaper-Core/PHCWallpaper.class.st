"
A reference to an online wallpaper file
"
Class {
	#name : #PHCWallpaper,
	#superclass : #Object,
	#traits : 'PHCTBrowseable + PHCTDescribed + PHCTNamed + PHCTSized',
	#classTraits : 'PHCTBrowseable classTrait + PHCTDescribed classTrait + PHCTNamed classTrait + PHCTSized classTrait',
	#instVars : [
		'imageURL',
		'size'
	],
	#category : #'Pharo-Compendium-Plugins-Wallpaper-Core-Model'
}

{ #category : #'instance creation' }
PHCWallpaper class >> fromDictionary: aCollection [ 

	^ (self new)
			name: (aCollection at: #name ifAbsent: '');
			description: (aCollection at: #description ifAbsent: '');	
			url: (aCollection at: #url ifAbsent: '');		
			imageURL: (aCollection at: #image_url ifAbsent: '');		
			size: (aCollection at: #size ifAbsent: '');											
			yourself
]

{ #category : #accessing }
PHCWallpaper >> imageURL [
	^ imageURL
]

{ #category : #accessing }
PHCWallpaper >> imageURL: aString [ 
	imageURL := aString
]
