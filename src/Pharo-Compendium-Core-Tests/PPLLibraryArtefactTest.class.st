Class {
	#name : #PPLLibraryArtefactTest,
	#superclass : #TestCase,
	#category : #'Pharo-Compendium-Core-Tests-Model'
}

{ #category : #tests }
PPLLibraryArtefactTest >> testInstanceCreation [

	self assert: (PHCInfoArtefact named: 'Test Artefact') name equals: 'Test Artefact'
]
