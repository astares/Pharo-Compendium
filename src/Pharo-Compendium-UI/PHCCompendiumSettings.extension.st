Extension { #name : #PHCCompendiumSettings }

{ #category : #'*Pharo-Compendium-UI' }
PHCCompendiumSettings class >> openSettings [ 
	<script>
	
	| browser window path |
	browser := SettingBrowser new 
		changePackageSet: { self package };
		yourself.
		 
	window := browser open.
	path := (window submorphs detect: [ :each | (each isKindOf: MorphTreeMorph)  ]) nodeList.
	browser expandNodePath: path first contents first contents first path.
]
