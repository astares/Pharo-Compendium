"
A github project
"
Class {
	#name : #PHCGitHubProject,
	#superclass : #PHCArtifact,
	#traits : 'PHCTLoadable + PHCTBrowseable',
	#classTraits : 'PHCTLoadable classTrait + PHCTBrowseable classTrait',
	#instVars : [
		'cloneURL',
		'sshURL',
		'owner'
	],
	#category : #'Pharo-Compendium-Extensions-GitHub-Core-Model'
}

{ #category : #accessing }
PHCGitHubProject >> cloneURL [
	^ cloneURL
]

{ #category : #accessing }
PHCGitHubProject >> cloneURL: anObject [
	cloneURL := anObject
]

{ #category : #accessing }
PHCGitHubProject >> owner [
	^ owner
]

{ #category : #accessing }
PHCGitHubProject >> owner: anObject [
	owner := anObject
]

{ #category : #accessing }
PHCGitHubProject >> sshURL [
	^ sshURL
]

{ #category : #accessing }
PHCGitHubProject >> sshURL: anObject [
	sshURL := anObject
]
