
import ceylon.language.meta.model {
	Class
}
"Defines relation between [[Source]] and [[Result]] objects"
by("Wojciech Potiopa")
shared class ObjectRelation<out Source=Anything,out Result=Anything>(source,resultClass) satisfies Relation<Source,Result>{
	shared actual Source source;
	"Result class type"
	shared actual Class<Result> resultClass ;
}