Class {
	#name : #FrameCounter,
	#superclass : #Morph,
	#instVars : [
		'millis',
		'count',
		'active',
		'value',
		'events',
		'eventsPerSecond'
	],
	#classVars : [
		'DefaultInstance'
	],
	#category : #FrameCounter
}

{ #category : #'as yet unclassified' }
FrameCounter class >> countEvent [

	DefaultInstance ifNotNil: [ DefaultInstance countEvent ].
]

{ #category : #'as yet unclassified' }
FrameCounter class >> defaultInstance [

	^ DefaultInstance ifNil: [ DefaultInstance := self new ]
]

{ #category : #'as yet unclassified' }
FrameCounter class >> open [ 
	
	^ self defaultInstance openInWindow.
]

{ #category : #'as yet unclassified' }
FrameCounter class >> reset [

	^ DefaultInstance := nil
]

{ #category : #initialization }
FrameCounter >> activate [

	active := true.
	millis := Time primMillisecondClock.
	count := 0.
	value := 0.
	events := 0.

	self startStepping.
]

{ #category : #'as yet unclassified' }
FrameCounter >> countEvent [

	events ifNil: [ events := 0 ].
	events := events + 1.
]

{ #category : #initialization }
FrameCounter >> drawOn: aCanvas [

	aCanvas fillRectangle: self bounds color: Color white.
	aCanvas fillOval: ((self bounds origin + (80@5)) extent: 10@10) color: Color random.
	aCanvas drawString: ('Frames: ' , value printString) in: self bounds.
	aCanvas drawString: ('Events: ' , eventsPerSecond printString) in: ((self bounds origin + (0@15)) extent: 100@50).


]

{ #category : #initialization }
FrameCounter >> initialize [

	super initialize.
	active := false.
]

{ #category : #initialization }
FrameCounter >> step [

	| now |

	active ifFalse: [ ^ self ].
	now := Time primMillisecondClock.
	count := count + 1.
		
	(millis + 1000 <= now) ifTrue: [ 
		value := (count / (now - millis) * 1000) asFloat round: 2.
		eventsPerSecond := (events / (now - millis) * 1000) asFloat round: 2.
		count := 0.
		millis := now.
		events := 0.
			
		self invalidRect: self bounds.
	].
]

{ #category : #initialization }
FrameCounter >> stepTime [ 

	^ 0
]
