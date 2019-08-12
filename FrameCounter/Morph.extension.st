Extension { #name : #Morph }

{ #category : #'*FrameCounter' }
Morph >> processEvent: anEvent [
	"Process the given event using the default event dispatcher."
	FrameCounter countEvent.
	^self processEvent: anEvent using: self defaultEventDispatcher
]
