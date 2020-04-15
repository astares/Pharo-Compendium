"
Help book for Compendium
"
Class {
	#name : #PHCCompendiumHelp,
	#superclass : #CustomHelp,
	#category : #'Pharo-Compendium-Help-Base'
}

{ #category : #accessing }
PHCCompendiumHelp class >> bookName [
	"Return the name of the help book"

	^ 'Compendium'
]

{ #category : #'class initialization' }
PHCCompendiumHelp class >> initialize [

	self resetSystemHelp
]

{ #category : #'accessing - pages' }
PHCCompendiumHelp class >> intro [
	^ HelpTopic 
		title: 'Compendium'
		contents: (self heading: 'Compendium Introduction'),
		'
Compendium is a new tool to list, browse and load Pharo artefacts like:
 - Projects
 - Wallpapers
 - ...
		
Compendium Repository: 

	', (self url: 'https://github.com/astares/Pharo-Compendium'), '
	', (self url: 'https://github.com/topics/pharo'), '
	', (self url: 'https://api.github.com/search/repositories?q=language:smalltalk+topic:pharo')
]

{ #category : #showing }
PHCCompendiumHelp class >> open [
	<script>
	^ (HelpBrowser openOn: self) next
]

{ #category : #showing }
PHCCompendiumHelp class >> pages [
	^ #(intro)
]

{ #category : #'private - initialization' }
PHCCompendiumHelp class >> resetSystemHelp [
	"Reset the (cached) system help so we appear there too"
	<script>
	SystemHelp resetHelpTopic
]
