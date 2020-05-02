"
Docu for the GitHub topic plugin
"
Class {
	#name : #PHCGitHubPluginHelp,
	#superclass : #PHCCompendiumHelp,
	#category : #'Pharo-Compendium-Help-Base'
}

{ #category : #accessing }
PHCGitHubPluginHelp class >> bookName [
	"Return the name of the help book"

	^ 'GitHub Topic plugin'
]

{ #category : #'accessing - pages' }
PHCGitHubPluginHelp class >> howToHaveMySoftwareListed [
	^ HelpTopic 
		title: 'Adding entries'
		contents: (self heading: 'How to have my software appear in the Compendium?'),
		'If you contribute to a GitHub repository related to a Pharo project, than this project deserves to appear in the Compendium. To have it listed you simply need to add the topic "pharo" to the GitHub repository. Note that if you may need to reset the caches of Compendium to refresh the list of displayed projects. You can reset the cache by selecting "Reset Caches" in the menu toolbar.
		
It is also important to have a short description in the GitHub webpage.'
]

{ #category : #'accessing - pages' }
PHCGitHubPluginHelp class >> intro [
	^ HelpTopic 
		title: 'Intro'
		contents: (self heading: 'Introduction'),
		'The GitHub Compendium plugin for GitHub lists all GitHub projects marked with the topic "pharo" within the Compendium list.

Basically this shows the following projects: 

	', (self url: 'https://github.com/topics/pharo'), '

that are retrieved from GitHub by using the following query:

	', (self url: 'https://api.github.com/search/repositories?q=language:smalltalk+topic:pharo')
]

{ #category : #accessing }
PHCGitHubPluginHelp class >> pages [
	^#(intro howToHaveMySoftwareListed)
]
