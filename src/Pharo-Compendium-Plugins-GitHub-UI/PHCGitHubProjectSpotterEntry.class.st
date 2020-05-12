"
A spotter entry for a github project
"
Class {
	#name : #PHCGitHubProjectSpotterEntry,
	#superclass : #PHCSpotterEntry,
	#category : #'Pharo-Compendium-Plugins-GitHub-UI-Spotter'
}

{ #category : #accessing }
PHCGitHubProjectSpotterEntry >> asString [ 

	^ item owner name asString, '/',item name asString
]
