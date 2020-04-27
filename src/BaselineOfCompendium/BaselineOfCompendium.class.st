"
Baseline for https://github.com/astares/Pharo-Compendium

(c) 2020 by T. Bergmann, astares.com
"
Class {
	#name : #BaselineOfCompendium,
	#superclass : #BaselineOf,
	#category : #BaselineOfCompendium
}

{ #category : #baseline }
BaselineOfCompendium >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		"STANDARD Packages"
		spec 
			package: 'Pharo-Compendium-Core';
			package: 'Pharo-Compendium-Core-Tests' with: [ spec requires: #('Pharo-Compendium-Core' ) ].
		
		"UI related like Spec2 and help packages"
		spec 
			package: 'Pharo-Compendium-Help';
			package: 'Pharo-Compendium-UI' with: [ spec requires: #('Pharo-Compendium-Core' 'Pharo-Compendium-Help') ].	
					
		"PLUGIN packages to provide custom artifact provider for GitHub"
		spec
			package: 'Pharo-Compendium-Plugins-GitHub-Core' with: [ spec requires: 'Pharo-Compendium-Core' ];
			package: 'Pharo-Compendium-Plugins-GitHub-UI' with: [ spec requires: 'Pharo-Compendium-Plugins-GitHub-Core' ].

		spec
			package: 'Pharo-Compendium-Plugins-Catalog-Core' with: [ spec requires: 'Pharo-Compendium-Core' ];
			package: 'Pharo-Compendium-Plugins-Catalog-UI' with: [ spec requires: 'Pharo-Compendium-Plugins-Catalog-Core' ].
			
		"Groups"	
		spec 
			group: 'Core' with: #('Pharo-Compendium-Core' );
			group: 'Extensions-Core' with: #('Pharo-Compendium-Extensions-GitHub-Core');
			group: 'UI' with: #('Pharo-Compendium-UI');
			group: 'Plugins' with: #('Pharo-Compendium-Plugins-GitHub-UI' 'Pharo-Compendium-Plugins-Catalog-UI');
			group: 'Help' with: #('Pharo-Compendium-Help');
			group: 'DevExtensions' with: #('Pharo-Compendium-UI-Extensions');
			group: 'Tests' with: #('Pharo-Compendium-Core-Tests' );
			group: 'all' with: #('Core' 'UI' 'Plugins' 'Help' 'DevExtensions' 'Tests' );
			group: 'default' with: #('all' ) 
	]
]
