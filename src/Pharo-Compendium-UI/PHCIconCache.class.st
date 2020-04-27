"
An icon cache
"
Class {
	#name : #PHCIconCache,
	#superclass : #Object,
	#classVars : [
		'ClassIconCache'
	],
	#category : #'Pharo-Compendium-UI-Utilities'
}

{ #category : #'private - accessing' }
PHCIconCache class >> classIconCache [

	^ ClassIconCache ifNil: [ ClassIconCache := Dictionary new ]
]

{ #category : #'private - utilities' }
PHCIconCache class >> generateIcon [
	<script>
	
	| base64Contents contentsMethod iconName fileRef |  
	fileRef := UIManager default chooseExistingFileReference: 'Select the PNG file'
							extensions: #('png') 
							path: ''.
	fileRef ifNil: [ ^ self ].
	iconName := UIManager default request: 'Class name for Icon' initialAnswer: 'blank'.
	iconName ifNil: [ ^ self ].
	base64Contents := (Base64MimeConverter mimeEncode: fileRef binaryReadStream) contents.
	 
	contentsMethod := String
		streamContents: [ :s | 
			s
				nextPutAll: 'icon';
				nextPutAll: iconName;
				nextPutAll: 'Contents';
				cr;
				cr;
				tab;
				nextPut: $^;
				nextPut: $';
				nextPutAll: base64Contents;
				nextPut: $' ].
	self class compile: contentsMethod classified: #'private - icons'.
	 
]

{ #category : #accessing }
PHCIconCache class >> iconForClass: aSymbol [
	"Returns the icon for the given class"
	
	| selector |
	selector := ('icon',aSymbol, 'Contents') asSymbol.
	(self class canUnderstand: selector) ifFalse: [ ^nil ].
	^ self classIconCache
		at: aSymbol
		ifAbsentPut: [ 
			Form
				fromBinaryStream: (self perform: selector) base64Decoded readStream ]
]

{ #category : #accessing }
PHCIconCache class >> iconNamed: aSymbol [

	^(self iconForClass: aSymbol) ifNil: [ super iconNamed: aSymbol ]
]

{ #category : #'private - icons' }
PHCIconCache class >> iconPHCCompendiumBrowserContents [

	^'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAARnQU1B
AACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAKlSURBVDhPpZJdSFNhAIYPghRGJHST
EF6ImOa/W1qUWDabaVPn/EEr587Zygq16ZqzphOkNBV0Yc0w19x2ttn+ndtS6yIou4nA0HnR
RXURaFYaRrdvcztkEOVFLzzwweF5vu/iEOFVRB6lRvkFTaa6XIm2Lu/iQyHnkq7+VOO4qLBJ
T/KkRrK0haZquzzipJLBbEbaWnbdsECqXUDjyCuckPlwvMWDfJkXHLkPBW0+cBX+ELyuOXTf
Hfzx1h9DMWp4+Q1jl2W6eUgGZsGSmJBJ6ZElNiCLMgTPYTJIPVJFNqhNI1h+nuBn1PA4V3St
8vE3EPfPgn3BBFZQZkuMf5AltkE69AC+6eSlQjWxm9EJgttMqxSGBVDbBFhiCypVetwMFEA2
k9zM6ARR1GoauE4vguybCQbovwYySRP47Wa0v8vGtQBbzegEwWuzapTmAES3/x3III3gKZy4
31cM+mrKU0YniNJ2h6HDsgThNoF00gCOcgqvOUKs5hzbyCOIXaEAX+lydk4EA73bBfTIU/rh
z6/E+uFD6I+Ojg0FBCrPtGoigLM9s0inaKSJ9KHb0kRbpAZJPK8DSzYFa40UKObCEhubEwpU
dXlfqoIvIHu9ONlMg9NkBFdqwulWM4plFpTIJ1DW9ghlCiuooWeQN/S8n89IV9sJYl840Glf
1Np8cEzaYXc7YJ90wOlxwjXlgtvrwqTPDe9jD7x+N+6NjiGFf2MkJDKLEEiHP869eILvG5+x
9nUZ62ubrIT4tr7Jp+C3L1hd+YA7Gg3icoUyxg3vSO0tdcfAKLS0FWO0jcH+Gw6MmRzQmp3o
1wT/SJ60m1F/LSLq4DnuntTqmqjEiuqopPKqHQlllTsP8Csi40sEkfFnyiPiivib7GWTvBhW
/X7G+98RxE91DtUzGsk0fQAAAABJRU5ErkJggg=='
]

{ #category : #'private - icons' }
PHCIconCache class >> iconPHCIconCacheContents [

	^'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAACzUlEQVR4Xq2TXUjTURyGvejC
0kKtNC3Cwo/ZQPImNiPZcjbNr00LSkhEdDN3UU2ibtLQJqXIltly0+mFLZo63bTpnCIGzW1K
ITbN6WbN5gdbLYlCccrb34GEtK7qgQOHc97znvP7OH7/jFar1alUql5fe06n86vBYJgwm80Y
Hx/H6uoqPB4PdokqKyu7hULhOI/H4++s+RPEEWg0mncCgcBTVlYGLpcLDocDnU4HqVT6Iisr
K9srrqioAIlEglwu38zNzc0LJNhDoFAousXip5uNkmd4P2m2D2gHRpuapKtJSUng8/kwmUwb
brf7p59SqQSbzUZaWtq28zfioLalpeUNYfhF29ePDxYLjEYTBrQ6CATVoFKpCA8PB5lMRnt7
O/zq6upaBgcHzWq12kWn01FQUAAajYZUJhNMxgXEJyQgPi4asScikZycAkILsVj8kUKhYPty
bxg2m+2Ty+Vy9/X1ecOpra3F/Py8y+FY3MhhZePJ/dt43vAID6urvImUSCRzRUVFEIlEbbsS
Sjy7s7S0FEKREMsrK2ujRuNWzkUmxhQSOIz9KMm/ipLCQuRdy0ePRvPDZ1mVXUonK4cNDpeD
jPRUNNVU4rtBjbWJIVheq6CR1EApb8XUlNnm04DFYuUuLS1Br9dDUH4HC2NDWDOqiNGLzbm3
sI0M4AorE6peNYZHhvV/GGQTLNjtuM4twenYKBRfykSX6AGc+n5s2ScxplWCFHkcZ6mJsM7O
/m6qcwQ78/J75YiLJSEiPAzBQQdwNPQg8tKT0VB1F8WX2QgO3I/Dh8LQ0dEJn2HIZDJkZKQj
JvokjoSGIPJYBIIC/BESsBfB+wLAoNHRKmvFzIzFtwHRtjy5vA2nyCQwGOcRGxOFRMoZ3Lp5
Y52RwoDi5ct1omKKv34wu93uWF5egsE4iubm5lc9PerPVuscHtfXN5qnpxetNqvD73/xCwA4
qxrzqJ48AAAAAElFTkSuQmCC'
]

{ #category : #'initialize - release' }
PHCIconCache class >> reset [
	<script>
	
	ClassIconCache := nil
]

{ #category : #accessing }
PHCIconCache class >> systemIcon [ 
	^self iconForClass: self name asSymbol
]
