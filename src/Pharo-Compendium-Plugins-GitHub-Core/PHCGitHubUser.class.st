"
A GitHub user
"
Class {
	#name : #PHCGitHubUser,
	#superclass : #PHCGitHubItem,
	#traits : 'PHCTBrowseable',
	#classTraits : 'PHCTBrowseable classTrait',
	#instVars : [
		'repositories'
	],
	#category : #'Pharo-Compendium-Plugins-GitHub-Core-Model'
}

{ #category : #accessing }
PHCGitHubUser >> repositories [
	^ repositories ifNil: [ repositories := SortedCollection sortBlock: [:a :b | a name < b name ] ]
]

{ #category : #accessing }
PHCGitHubUser >> repositories: anObject [
	repositories := anObject
]
