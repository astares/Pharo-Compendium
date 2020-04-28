"
Install a stable version
"
Class {
	#name : #PHCInstallStableVersionCommand,
	#superclass : #PHCCommand,
	#category : #'Pharo-Compendium-Plugins-Catalog-UI-Commands'
}

{ #category : #accessing }
PHCInstallStableVersionCommand class >> defaultName [

	^'Install stable version'
]

{ #category : #executing }
PHCInstallStableVersionCommand >> execute [
	"Execute the actions that should be done by the command.
	 This method expect that the context has been put in #context inst. var. if any context is relevant."
	1 inspect
]
