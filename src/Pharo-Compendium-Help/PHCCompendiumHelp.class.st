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

{ #category : #'accessing - pages' }
PHCCompendiumHelp class >> howToHaveMySoftwareListed [
	^ HelpTopic 
		title: 'Adding entries'
		contents: (self heading: 'How to have my software appear in the Compendium?'),
		'If you contribute to a GitHub repository related to a Pharo project, than this project deserves to appear in the Compendium. To have it listed you simply need to add the topic "pharo" to the GitHub repository. Note that if you may need to reset the caches of Compendium to refresh the list of displayed projects. You can reset the cache by selecting "Reset Store" in the menu toolbar.
		
It is also important to have a short description in the GitHub webpage.'
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
 - GitHub Projects
 - Catalog Projects
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
	^ #(intro howToHaveMySoftwareListed)
]

{ #category : #'private - initialization' }
PHCCompendiumHelp class >> resetSystemHelp [
	"Reset the (cached) system help so we appear there too"
	<script>
	SystemHelp resetHelpTopic
]
