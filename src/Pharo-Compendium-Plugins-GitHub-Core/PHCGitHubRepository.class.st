"
A github project
"
Class {
	#name : #PHCGitHubRepository,
	#superclass : #PHCGitHubItem,
	#traits : 'PHCTLoadable + PHCTBrowseable',
	#classTraits : 'PHCTLoadable classTrait + PHCTBrowseable classTrait',
	#instVars : [
		'cloneURL',
		'sshURL',
		'owner'
	],
	#category : #'Pharo-Compendium-Plugins-GitHub-Core-Model'
}

{ #category : #accessing }
PHCGitHubRepository >> cloneURL [
	^ cloneURL
]

{ #category : #accessing }
PHCGitHubRepository >> cloneURL: anObject [
	cloneURL := anObject
]

{ #category : #accessing }
PHCGitHubRepository >> owner [
	^ owner
]

{ #category : #accessing }
PHCGitHubRepository >> owner: anObject [
	owner := anObject
]

{ #category : #accessing }
PHCGitHubRepository >> sshURL [
	^ sshURL
]

{ #category : #accessing }
PHCGitHubRepository >> sshURL: anObject [
	sshURL := anObject
]
