Extension { #name : #PHCArtifactPresenter }

{ #category : #'*Pharo-Compendium-UI-Extensions' }
PHCArtifactPresenter class >> extraCommandsWith: presenter forRootGroup: aCmCommandsGroup [
	"This is an additional extension menu group - only used for development"
	
	<extensionCommands>
	aCmCommandsGroup / 'Context Menu'
		register:
			((CmCommandGroup named: 'Extra') asSpecGroup
				description: 'Extra commands to help during development.';
					register:
					((PHCInspectArtifactCommand forSpec
						context: [ presenter selectedArtifact ])
						name: 'Inspect artifact';
						description: 'Open an inspector on the selected artifact.';
						yourself);				 
				yourself)	
]
