import ceylon.language.meta.model {
	Type,
	Class
}
import herd.convertx.core.api {
	Context
}
import herd.convertx.core.api.component {
	ComponentFindingException
}
import herd.convertx.core.api.meta {
	Description
}
import herd.convertx.core.internal {
	Executable,
	Registry,
	defaultFindStrategy
}

shared class DefaultContext(Registry registry, Executable.FindStrategy strategy = defaultFindStrategy) satisfies Context {
	
	shared actual Result convert<Result>(Anything source, Type<Result> resultType) {
		value hashable = [source, resultType];
		value args = [this, source, resultType];
		if (exists executable = strategy.find(registry.converters, hashable)) {
			assert (is Result result = executable.execute(args));
			return result;
		}
		throw ComponentFindingException("Can't find Converter for provided arguments: source - `` source else "null" ``, resultType - ``resultType``");
	}
	shared actual Class<Result> resolve<Result>(Type<Result> input) {
		value args = [input];
		if(exists executable =strategy.find(registry.resolvers, args)){
			assert(is Class<Result> result=executable.execute(args));
			return result;
		}
		
		throw ComponentFindingException("Can't find resolver for provided arguments: input - ``input``");
	}
	
	shared actual Result create<Result>(Class<Result,Nothing> kind, Anything args) {
		value params = [kind, args];
		if(exists executable=strategy.find(registry.creators,params)){
			assert(is Result result=executable.execute(params));
			return result;
		}
		throw ComponentFindingException("Can't find creator for provided arguments: kind - ``kind``, args - `` args else "null" ``");
	}
	shared actual Description describe(Anything source, Class<Anything> destinationType) {
		value args = [source, destinationType];
		if(exists executable=strategy.find(registry.descriptors,args)){
			assert(is Description result=executable.execute(args));
			return result;
		}
		throw ComponentFindingException("Can't find descriptor for provided arguments: source - ``source else "null"``, destinationType - ``destinationType``");
	}
}
