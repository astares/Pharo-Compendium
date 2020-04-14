"
Main UI window for the library browser
"
Class {
	#name : #PPLCompendiumBrowser,
	#superclass : #SpPresenter,
	#category : #'Pharo-Compendium-UI-Windows'
}

{ #category : #specs }
PPLCompendiumBrowser class >> defaultSpec [
	^ SpBoxLayout newVertical  
]

{ #category : #showing }
PPLCompendiumBrowser class >> open [
	<script>

	self new openWithSpec
]

{ #category : #defaults }
PPLCompendiumBrowser >> title [ 

   ^'Pharo compendium'
]
