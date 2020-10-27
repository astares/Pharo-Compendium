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
PHCCompendiumHelp class >> intro [
	^ HelpTopic 
		title: 'Compendium'
		contents: (self heading: 'Compendium'),
		'Compendium is a new tool to list, browse and load Pharo artefacts from the web like:
 - GitHub Projects
 - Catalog Projects
and other

By default there are two plugin packages available for GitHub and Catalog - but you can implement own ones easily to connect to other sources on the web.

Compendium is available on:  

	', (self url: 'https://github.com/astares/Pharo-Compendium')
]

{ #category : #showing }
PHCCompendiumHelp class >> open [
	<script>
	^ (HelpBrowser openOn: self) next
]

{ #category : #showing }
PHCCompendiumHelp class >> pages [
	^ #(intro )
]
