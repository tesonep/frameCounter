Class {
	#name : #BaselineOfFrameCounter,
	#superclass : #BaselineOf,
	#category : #BaselineOfFrameCounter
}

{ #category : #baselines }
BaselineOfFrameCounter >> baseline: spec [

	<baseline>

	spec for: #common
		do: [ 
			spec
				package: 'FrameCounter';
				group: 'default' with: #('FrameCounter') ]
]
