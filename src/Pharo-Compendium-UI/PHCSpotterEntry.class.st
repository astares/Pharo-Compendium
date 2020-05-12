"
Generic spotter entry for Compendium
"
Class {
	#name : #PHCSpotterEntry,
	#superclass : #SptEntry,
	#instVars : [
		'item'
	],
	#category : #'Pharo-Compendium-UI-Spotter'
}

{ #category : #'instance creation' }
PHCSpotterEntry class >> on: anItem [

	^(self new)
		item: anItem;
		yourself
]

{ #category : #'spotter-extensions' }
PHCSpotterEntry >> asString [ 

	^ item name asString
]

{ #category : #'spotter-extensions' }
PHCSpotterEntry >> doEvaluate [ 

	| cmdClass |
	cmdClass := item class spotterActivationCommand.
	cmdClass new 
		context: self;
		execute
		
	
]

{ #category : #'spotter-extensions' }
PHCSpotterEntry >> icon [
	
	^ self item class systemIcon
]

{ #category : #accessing }
PHCSpotterEntry >> item [
	^ item
]

{ #category : #accessing }
PHCSpotterEntry >> item: anObject [
	item := anObject
]

{ #category : #accessing }
PHCSpotterEntry >> selectedItem [ 
	^self item
]

{ #category : #'spotter-extensions' }
PHCSpotterEntry >> spotterPreviewIn: aPresenter [

	<spotterPreview: 10>
	^ aPresenter text
		title: 'Name';
		display: [ :spotterItem | spotterItem item name asString contractTo: 100 ];
		entity: self
]
