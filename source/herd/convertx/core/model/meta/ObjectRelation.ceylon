import herd.convertx.core.api.meta {
	Relation
}
import ceylon.language.meta.model {
	Class
}
shared class ObjectRelation<out Source=Anything,out Result=Anything>(source,resultClass) satisfies Relation<Source,Result>{
	shared actual Source source;
	
	shared actual Class<Result> resultClass ;
}