Class {
	#name : #PHCArtefactTest,
	#superclass : #TestCase,
	#category : #'Pharo-Compendium-Core-Tests-Model'
}

{ #category : #tests }
PHCArtefactTest >> testInstanceCreation [

	self assert: (PHCArtefact named: 'Test Artefact') name equals: 'Test Artefact'
]

{ #category : #tests }
PHCArtefactTest >> testIsAbstract [

	self assert: PHCArtefact isAbstract 
]
