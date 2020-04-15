"
An object that is used in the compendium
"
Class {
	#name : #PHCCompendiumItem,
	#superclass : #Object,
	#traits : 'PHCTUniquelyIdentified + PHCTNamed + PHCTDescribed',
	#classTraits : 'PHCTUniquelyIdentified classTrait + PHCTNamed classTrait + PHCTDescribed classTrait',
	#category : #'Pharo-Compendium-Core-Model'
}

{ #category : #'instance creation' }
PHCCompendiumItem class >> named: aName [

	^(self new)	
		name: aName;
		yourself
]

{ #category : #testing }
PHCCompendiumItem >> isBrowseable [
	"Its not browseable by default"
	
	^false
]

{ #category : #testing }
PHCCompendiumItem >> isLoadable [
	"Its not loadable by default"
	
	^false
]
