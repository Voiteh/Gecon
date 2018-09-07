import ceylon.language.meta.model {
	Class
}
shared interface Relation<out Source=Anything,out Result=Anything> {
	
	shared formal Source source;
	shared formal Class<Result> resultClass;
	
}