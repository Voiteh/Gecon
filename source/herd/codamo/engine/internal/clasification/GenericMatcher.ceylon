"Findable implementation"
shared class GenericMatcher(
	shared actual Classificator classificator,
	shared Boolean match(Anything[] args),
	shared Integer priority) satisfies Classificable{
	
}