"
Help book for Compendium
"
Class {
	#name : #CompendiumHelp,
	#superclass : #CustomHelp,
	#category : #'Pharo-Compendium-Help-Base'
}

{ #category : #accessing }
CompendiumHelp class >> bookName [
	"Return the name of the help book"

	^ 'Pharo Compendium'
]

{ #category : #'accessing - pages' }
CompendiumHelp class >> intro [
	^ HelpTopic 
		title: 'Compendium'
		contents: (self heading: 'Compendium Introduction'),
		'
Compendium is a new tool to list, browse and load Pharo artefacts like:
 - Projects
 - Wallpapers
 - ...
		
Compendium Repository: 

	', (self url: 'https://github.com/astares/Pharo-Compendium') 
]

{ #category : #showing }
CompendiumHelp class >> open [
	<script>
	^ (HelpBrowser openOn: self) next
]

{ #category : #showing }
CompendiumHelp class >> pages [
	^ #(intro)
]
