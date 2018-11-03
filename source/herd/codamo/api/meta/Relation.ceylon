import ceylon.language.meta.model {
	Class
}
"API for defining relations [[Source]] and [[Result]] data."
shared interface Relation<out Source=Anything,out Result=Anything> {
	
	shared formal Source source;
	shared formal Class<Result> resultClass;
	
}