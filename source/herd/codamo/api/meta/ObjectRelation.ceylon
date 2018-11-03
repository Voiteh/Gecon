
import ceylon.language.meta.model {
	Class
}
"Defines relation between [[Source]] and [[Result]] objects"
shared class ObjectRelation<out Source=Anything,out Result=Anything>(source,resultClass) satisfies Relation<Source,Result>{
	shared actual Source source;
	
	shared actual Class<Result> resultClass ;
}