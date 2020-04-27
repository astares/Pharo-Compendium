"
Common superclass for GitHub Items 
"
Class {
	#name : #PHCGitHubItem,
	#superclass : #PHCArtifact,
	#traits : 'PHCTBrowseable',
	#classTraits : 'PHCTBrowseable classTrait',
	#category : #'Pharo-Compendium-Plugins-GitHub-Core-Model'
}

{ #category : #testing }
PHCGitHubItem class >> isAbstract [ 
	^self == PHCGitHubItem 
]
