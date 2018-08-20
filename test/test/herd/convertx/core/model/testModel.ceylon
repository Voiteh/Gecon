import ceylon.language.meta.model {
	Type,
	Class
}
import herd.convertx.core.api.meta {
	Description
}
import herd.convertx.core.api.component {
	ComponentFindingException
}
import herd.convertx.core.api {
	Context
}
shared class MockContext() satisfies Context{
	shared actual Result convert<Result>(Anything source, Type<Result> resultType) { throw ComponentFindingException("Not found");}
	
	shared actual Result create<Result>(Class<Result,Nothing> kind, Anything args) { throw ComponentFindingException("Not found");}
	
	shared actual Description describe(Anything source, Class<Anything,Nothing> destinationType) { throw ComponentFindingException("Not found");}
	
	shared actual Class<Result,Nothing> resolve<Result>(Anything source, Type<Result> resultType) { throw ComponentFindingException("Not found");}
	
	
}