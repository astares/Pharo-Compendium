"
Utility class to crawl wallpaper registry items
"
Class {
	#name : #PHCWallpaperCrawler,
	#superclass : #Object,
	#category : #'Pharo-Compendium-Plugins-Wallpaper-Core-Utilities'
}

{ #category : #utilities }
PHCWallpaperCrawler class >> cache [

	^ Dictionary new
]

{ #category : #examples }
PHCWallpaperCrawler class >> example [
	

	 ^(self wallpapersForURL: 'https://raw.githubusercontent.com/pharo-compendium/pharo-registry-wallpapers/main/registry/wallpaper.json') inspect
]

{ #category : #utilities }
PHCWallpaperCrawler class >> wallpapersForURL: anURLString [
	"Gives a URL pointing to a JSON file describing the wallpapers"

	|entries|
	^ self cache at: anURLString ifAbsentPut: [ 
	entries := STON fromString: (ZnEasy get: anURLString) contents.
	entries collect: [:each | PHCWallpaper fromDictionary: each ]]
]
