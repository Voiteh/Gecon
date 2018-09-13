import herd.convertx.core.api.component {
	Converter,
	Resolver,
	Creator
}
import herd.convertx.core.api {
	Context
}
import ceylon.language.meta.model {
	Class,
	Type
}

import ceylon.logging {
	trace
}
import herd.convertx.core {
	logger
}

shared sealed interface Executable {
	
	shared static interface FindStrategy{
		shared formal Executable? find(ComponentContainer container,Anything[] args);
	}
	
	shared static interface Adapter{
		shared formal Executable adaptConverter<Source, Result>(Converter<Source,Result> converter);
		shared formal Executable adaptResolver<Source,Result>(Resolver<Source,Result> resolver);
		shared formal Executable adaptCreator<Arguments,Result>(Creator<Arguments,Result> creator);
	}
	
	shared formal Anything execute(Anything[] args);
	
	
	
	
}
shared Executable.FindStrategy defaultFindStrategy =>  object satisfies Executable.FindStrategy{
	shared actual Executable? find(ComponentContainer container, Anything[] args) {
		//until resolved https://github.com/eclipse/ceylon/issues/7389 hashing for Touple arg will fail. 
		value hashable=Hashable(*args);
		logger.debug("Looking for Executable using Hashable:``hashable``");
		if (exists executable = container.get(hashable)) {
			logger.debug("FOUND Executable ``executable``");
			return executable;
		}
		logger.debug("Executable NOT FOUND by Hashable ``hashable``");
		if(logger.priority>=trace){
			logger.trace("Available Hashables were:");
			container.filter((Findable elementKey -> Executable elementItem) => elementKey is Hashable)
					.each((Findable findable -> Executable executable) => logger.trace("``findable``-> ``executable``"));
		}
		if (exists matchable = container.keys.narrow<Matchable>()
			.filter((Matchable element) => element.match(args))
				.sort((Matchable x, Matchable y) => y.priority.compare(x.priority))
				.first){
			return container.get(matchable);
		}
		return null;
	}
};


Executable.Adapter defaultExecutableAdapter=> object satisfies Executable.Adapter{
	shared actual Executable adaptConverter<Source,Result>(Converter<Source,Result> converter) => object satisfies Executable{
		shared actual Anything execute(Anything[] args) {
			assert(is [Context,Source, Type<Result>] args);
			return converter.convert(*args);
		}
		string = "Converter - ``converter``";	
	};
	
	shared actual Executable adaptCreator<Args,Result>(Creator<Args,Result> creator) => object satisfies Executable{
		shared actual Anything execute(Anything[] args) {
			assert(is [Context,Class<Result>,Args] args);
			return creator.create(*args);
		}
		string = "Creator - ``creator``";	
	};
	
	
	shared actual Executable adaptResolver<Source,Result>(Resolver<Source,Result> resolver) => object satisfies Executable{
		shared actual Anything execute(Anything[] args) {
			assert(is [Context,Source,Type<Result>] args);
			return resolver.resolve(*args);
		}
		string = "Resolver - ``resolver``";	
	};
	
	
};

