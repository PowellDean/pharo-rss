"
What is RSS?

RSS is a Web content syndication format.

Its name is an acronym for Really Simple Syndication.

RSS is a dialect of XML. All RSS files must conform to the XML 1.0 specification, as published on the World Wide Web Consortium (W3C) website.

A summary of RSS version history.

At the top level, a RSS document is a <rss> element, with a mandatory attribute called version, that specifies the version of RSS that the document conforms to. If it conforms to this specification, the version attribute must be 2.0.

Subordinate to the <rss> element is a single <channel> element, which contains information about the channel (metadata) and its contents.
"
Class {
	#name : #RSSFeed,
	#superclass : #Object,
	#instVars : [
		'version',
		'title',
		'link',
		'description',
		'language',
		'pubDate',
		'lastBuildDate',
		'docs',
		'generator',
		'managingEditor',
		'webMaster',
		'itemList',
		'uri'
	],
	#category : #'RSSFeed-Reader'
}

{ #category : #'as yet unclassified' }
RSSFeed class >> elementNamed: aString inNode: aNode [
	| value |
	value := ((aNode elementAt: aString) ifNil: [^ '']).
	((value nodes) size = 1)
		ifTrue: [ ^ value nodes at: 1 ]
		ifFalse: [^ Error new signal: 'RSS Element expecting single node' ].
]

{ #category : #'instance creation' }
RSSFeed class >> on: aURI [
	^ self new loadFromURI: aURI
]

{ #category : #accessing }
RSSFeed >> description [

	^ description
]

{ #category : #accessing }
RSSFeed >> description: anObject [

	description := anObject
]

{ #category : #accessing }
RSSFeed >> docs [

	^ docs
]

{ #category : #accessing }
RSSFeed >> docs: anObject [

	docs := anObject
]

{ #category : #accessing }
RSSFeed >> generator [

	^ generator
]

{ #category : #accessing }
RSSFeed >> generator: anObject [

	generator := anObject
]

{ #category : #initialization }
RSSFeed >> initialize [
	^ self
		description: '';
		docs: '';
		generator: '';
		itemList: OrderedCollection new;
		language: '';
		lastBuildDate: '';
		link: '';
		managingEditor: '';
		webMaster: '';
		uri: '';
		yourself
]

{ #category : #accessing }
RSSFeed >> itemList [

	^ itemList
]

{ #category : #accessing }
RSSFeed >> itemList: anObject [

	itemList := anObject
]

{ #category : #accessing }
RSSFeed >> language [

	^ language
]

{ #category : #accessing }
RSSFeed >> language: anObject [

	language := anObject
]

{ #category : #accessing }
RSSFeed >> lastBuildDate [

	^ lastBuildDate
]

{ #category : #accessing }
RSSFeed >> lastBuildDate: anObject [

	lastBuildDate := anObject
]

{ #category : #accessing }
RSSFeed >> link [

	^ link
]

{ #category : #accessing }
RSSFeed >> link: anObject [

	link := anObject
]

{ #category : #parsing }
RSSFeed >> loadFromURI: aURI [

	| xmlStream xmlDoc dom channel singleItem |
	self initialize .
	xmlStream := aURI asUrl retrieveContents.

	xmlDoc := XMLDOMParser parse: xmlStream.

	dom := (xmlDoc elementAt: 'rss').
	self version: (dom attributeAt: 'version').
	channel := dom elementAt: 'channel'.
	
	self title: ((self class) elementNamed: 'title' inNode: channel).
	self link: ((self class) elementNamed: 'link' inNode: channel).
	self description: ((self class) elementNamed: 'description' inNode: channel).
	self language: ((self class) elementNamed: 'language' inNode: channel).
	self pubDate: ((self class) elementNamed: 'pubDate' inNode: channel).
	self lastBuildDate: ((self class) elementNamed: 'lastBuildDate' inNode: channel).
	self docs: ((self class) elementNamed: 'docs' inNode: channel).
	self generator: ((self class) elementNamed: 'generator' inNode: channel).
	self managingEditor: ((self class) elementNamed: 'managingEditor' inNode: channel).
	self webMaster: ((self class) elementNamed: 'webMaster' inNode: channel).
	
	channel elementsAt: 'item' do: [ :thisItem |
		singleItem := RSSItem on: thisItem.
		itemList add: singleItem].
	^ self
]

{ #category : #accessing }
RSSFeed >> managingEditor [

	^ managingEditor
]

{ #category : #accessing }
RSSFeed >> managingEditor: anObject [

	managingEditor := anObject
]

{ #category : #accessing }
RSSFeed >> pubDate [

	^ pubDate
]

{ #category : #accessing }
RSSFeed >> pubDate: anObject [

	pubDate := anObject
]

{ #category : #accessing }
RSSFeed >> title [

	^ title
]

{ #category : #accessing }
RSSFeed >> title: anObject [

	title := anObject.
]

{ #category : #accessing }
RSSFeed >> uri [

	^ uri
]

{ #category : #accessing }
RSSFeed >> uri: aURI [

	uri := aURI
]

{ #category : #accessing }
RSSFeed >> version [

	^ version
]

{ #category : #accessing }
RSSFeed >> version: anObject [

	version := anObject
]

{ #category : #accessing }
RSSFeed >> webMaster [

	^ webMaster
]

{ #category : #accessing }
RSSFeed >> webMaster: anObject [

	webMaster := anObject
]
