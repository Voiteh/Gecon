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
import herd.convertx.core.internal {
	Executable,
	Registry,
	defaultFindStrategy
}


import herd.convertx.core {
	logger
}

shared class DefaultContext(Registry registry, Executable.FindStrategy strategy = defaultFindStrategy) satisfies Context {
	
	shared actual Result convert<Result>(Anything source, Type<Result> resultType) {
		value hashable = [source, resultType];
		value args = [this, source, resultType];
		if (exists executable = strategy.find(registry.converters, hashable)) {
			logger.debug("Found ``executable``, for arguments:``hashable``" );
			assert (is Result result = executable.execute(args));
			logger.debug("Converted: ``source else "null"`` to ``resultType``,result: ``result else "null"``");
			return result;
		}
		throw ComponentFindingException("Can't find Converter for provided arguments: source - `` source else "null" ``, resultType - ``resultType``");
	}
	shared actual Class<Result> resolve<Result>(Anything source,Type<Result> resultType) {
		value hashable = [source, resultType];
		value args = [this,source,resultType];
		if(exists executable =strategy.find(registry.resolvers, hashable)){
			logger.debug("Found ``executable``, for arguments:``hashable``" );
			assert(is Class<Result> result=executable.execute(args));
			logger.debug("Resolved: ``source else "null"`` to ``resultType``,result: ``result``");
			return result;
		}
		
		throw ComponentFindingException("Can't find resolver for provided arguments: input - ``source else "null"``, resultType - ``resultType``");
	}
	
	shared actual Result create<Result>(Class<Result,Nothing> kind, Anything args) {
		value hashable = [kind, args];
		value params=[this,kind,args];
		if(exists executable=strategy.find(registry.creators,hashable)){
			logger.debug("Found ``executable``, for arguments:``hashable``" );
			assert(is Result result=executable.execute(params));
			logger.debug("Created class: ``kind`` with arguments ``args else "null"``,result: ``result else "null"``");
			return result;
		}
		throw ComponentFindingException("Can't find creator for provided arguments: kind - ``kind``, args - `` args else "null" ``");
	}
}
