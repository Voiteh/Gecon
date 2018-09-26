import ceylon.language.meta.model {
	Class
}

import herd.convertx.api {
	Context
}

import herd.convertx.api.registration {
	Executable,
	Findable,
	Visitor
}

shared sealed interface TypedCreator<in Args=Nothing,out Result=Anything, in Kind=Nothing> satisfies Component given Kind satisfies Result {
	
	throws (`class ConvertionException`)
	shared formal Result create(Context context,Class<Kind> kind, Args arguments);
	
	shared actual [Findable, Executable] flatten(Visitor visitor) => visitor.prepareCreatorRegistration(this);
	
	shared interface Matcher {
		shared formal Boolean match(Class<Kind> kind, Args arguments);
		shared formal Integer priority;
	}
	
	shared default Matcher? matcher => null;
}
shared interface Creator<Args,Result > satisfies  TypedCreator<Args,Result,Result> {
	
	throws (`class ConvertionException`)
	shared formal actual Result create(Context context,Class<Result> kind, Args arguments);

}
