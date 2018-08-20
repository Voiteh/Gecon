import ceylon.language.meta.model {
	Class
}
import herd.convertx.core.api.meta {
	Description
}
import herd.convertx.core.internal {
	Executable,
	Findable
}
import herd.convertx.core.api {
	Context
}

shared interface TypedDescriptor<in Source=Nothing, in Destination=Nothing> satisfies Component {
	
	throws(`class DescriptionException`)
	shared formal Description describe(Context context,Source source,Class<Destination> destinationType );
	
	shared actual Executable toExecutable(Executable.Adapter visitor) => visitor.adaptDescriptor(this);
	shared actual Findable toFindable(Findable.Adapter visitor) => visitor.adaptDescriptor(this);
	
	shared interface Matcher {
		shared formal Boolean match(Source source,Class<Destination> destinationType);
		shared formal Integer priority;
	}
	
	shared default Matcher? matcher=>null;
	
}


shared interface Descriptor<Source,Destination>  satisfies TypedDescriptor<Source, Destination>{
	
	throws(`class DescriptionException`)
	shared actual formal Description describe(Context context,Source source,Class<Destination> destinationType );
	
	
	
	
	
}