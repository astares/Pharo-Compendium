Extension { #name : #PHCItemPresenter }

{ #category : #'*Pharo-Compendium-UI-Extensions' }
PHCItemPresenter class >> extraCommandsWith: presenter forRootGroup: aCmCommandsGroup [
	"This is an additional extension menu group - only used for development"
	
	<extensionCommands>
	aCmCommandsGroup / 'Context Menu'
		register:
			((CmCommandGroup named: 'Extra') asSpecGroup
				description: 'Extra commands to help during development.';
					register:
					((PHCInspectItemCommand forSpec
						context: [ presenter selectedItem ])
						name: 'Inspect item';
						description: 'Open an inspector on the selected item.';
						yourself);				 
				yourself)	
]
