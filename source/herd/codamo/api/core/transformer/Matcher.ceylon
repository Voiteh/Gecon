import ceylon.language.meta.model {
	Type
}
shared class Matcher<Source,ResultType>(
	shared Boolean match(Source source, ResultType resultType),
	shared Integer priority)
given ResultType satisfies Type<> 
{}
