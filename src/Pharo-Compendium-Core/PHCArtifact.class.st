"
A Pharo project library object
"
Class {
	#name : #PHCArtifact,
	#superclass : #Object,
	#traits : 'PHCTUniquelyIdentified + PHCTNamed + PHCTDescribed',
	#classTraits : 'PHCTUniquelyIdentified classTrait + PHCTNamed classTrait + PHCTDescribed classTrait',
	#category : #'Pharo-Compendium-Core-Model'
}

{ #category : #'instance creation' }
PHCArtifact class >> named: aName [

	^(self new)	
		name: aName;
		yourself
]

{ #category : #testing }
PHCArtifact >> isBrowseable [
	"Its not browseable by default"
	
	^false
]

{ #category : #testing }
PHCArtifact >> isLoadable [
	"Its not loadable by default"
	
	^false
]
