"Findable implementation"
shared class Matcher(
	shared actual Classificator classificator,
	shared Boolean match(Anything[] args),
	shared Integer priority) satisfies Classificable{
	
}