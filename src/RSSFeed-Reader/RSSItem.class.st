Class {
	#name : #RSSItem,
	#superclass : #Object,
	#instVars : [
		'title',
		'link',
		'description',
		'pubDate',
		'guid'
	],
	#category : #'RSSFeed-Reader'
}

{ #category : #'as yet unclassified' }
RSSItem class >> elementNamed: aString inNode: aNode [
	| value |
	value := ((aNode elementAt: aString) ifNil: [^ '']).
	((value nodes) size = 1)
		ifTrue: [ ^ value nodes at: 1 ]
		ifFalse: [^ Error new signal: 'RSS Element expecting single node' ].
]

{ #category : #'instance creation' }
RSSItem class >> on: anElement [

	^ self new loadFromElement: anElement
]

{ #category : #accessing }
RSSItem >> description [

	^ description
]

{ #category : #accessing }
RSSItem >> description: anObject [

	description := anObject
]

{ #category : #accessing }
RSSItem >> guid [

	^ guid
]

{ #category : #accessing }
RSSItem >> guid: anObject [

	guid := anObject
]

{ #category : #initialization }
RSSItem >> initialize [
	^ self
		description: '';
		guid: '';
		link: '';
		pubDate: '';
		title: '';
		yourself
]

{ #category : #accessing }
RSSItem >> link [

	^ link
]

{ #category : #accessing }
RSSItem >> link: anObject [

	link := anObject
]

{ #category : #parsing }
RSSItem >> loadFromElement: aNode [

	self title: ((self class) elementNamed: 'title' inNode: aNode).
	self link: ((self class) elementNamed: 'link' inNode: aNode).
	self description: ((self class) elementNamed: 'description' inNode: aNode).
	self pubDate: ((self class) elementNamed: 'pubDate' inNode: aNode).
	self guid: ((self class) elementNamed: 'guid' inNode: aNode).
]

{ #category : #accessing }
RSSItem >> pubDate [

	^ pubDate
]

{ #category : #accessing }
RSSItem >> pubDate: anObject [

	pubDate := anObject
]

{ #category : #accessing }
RSSItem >> title [

	^ title
]

{ #category : #accessing }
RSSItem >> title: anObject [

	title := anObject
]
