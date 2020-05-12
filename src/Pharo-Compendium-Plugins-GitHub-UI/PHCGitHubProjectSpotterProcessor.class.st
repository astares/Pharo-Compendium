"
A Spotter processor to display found github projects in spotter
"
Class {
	#name : #PHCGitHubProjectSpotterProcessor,
	#superclass : #PHCSpotterProcessor,
	#category : #'Pharo-Compendium-Plugins-GitHub-UI-Spotter'
}

{ #category : #accessing }
PHCGitHubProjectSpotterProcessor class >> title [
	
	^ 'Compendium - GitHub Projects'
]

{ #category : #accessing }
PHCGitHubProjectSpotterProcessor >> collection [ 
	| catalogStore |
	catalogStore := PHCArtifactStore allArtefactStores detect: [:each | each class = PHCGitHub ] ifNone: [ ^#() ].	 
	^catalogStore children  
]

{ #category : #'private - accessing' }
PHCGitHubProjectSpotterProcessor >> spotterEntryClass [
	"Return the class used for the spotter entries - subclasses can override"
	
	^PHCGitHubProjectSpotterEntry 
]
