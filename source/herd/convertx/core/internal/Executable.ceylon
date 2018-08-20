import herd.convertx.core.api.component {
	TypedResolver,
	TypedCreator,
	TypedConverter,
	TypedDescriptor
}
import herd.convertx.core.api {
	Context
}
import ceylon.language.meta.model {
	Class
}
shared sealed interface Executable {
	shared static interface FindStrategy{
		shared formal Executable? find(Container container,Anything[] args);
	}
	
	shared static interface Adapter{
		shared formal Executable adaptConverter<Source,ResultType, Result>(TypedConverter<Source,ResultType,Result> converter);
		shared formal Executable adaptResolver<Base,Output,Input>(TypedResolver<Base,Output,Input> resolver);
		shared formal Executable adaptCreator<Result,Kind, Args>(TypedCreator<Result,Kind,Args> creator);
		shared formal Executable adaptDescriptor<Source,Destination>(TypedDescriptor<Source,Destination> descriptor);	
	}
	

	
	shared formal Anything execute(Anything[] args);
	
	
	
	
}
shared Executable.FindStrategy defaultFindStrategy =>  object satisfies Executable.FindStrategy{
	shared actual Executable? find(Container container, Anything[] args) {
		//until resolved https://github.com/eclipse/ceylon/issues/7389 hashing for Touple arg will fail. 
		value hashable=Hashable(*args);
		if (exists executable = container.get(hashable)) {
			return executable;
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
	shared actual Executable adaptConverter<Source, ResultType,Result>(TypedConverter<Source, ResultType,Result> converter) => object satisfies Executable{
		shared actual Anything execute(Anything[] args) {
			assert(is [Context,Source, ResultType] args);
			return converter.convert(*args);
		}
		string = "Converter - ``converter``";	
	};
	
	shared actual Executable adaptCreator<Result,Kind, Args>(TypedCreator<Result,Kind,Args> creator) => object satisfies Executable{
		shared actual Anything execute(Anything[] args) {
			assert(is [Context,Class<Kind>,Args] args);
			return creator.create(*args);
		}
		string = "Creator - ``creator``";	
	};
	
	shared actual Executable adaptDescriptor<Source,Destination>(TypedDescriptor<Source,Destination> descriptor) => object satisfies Executable{
		shared actual Anything execute(Anything[] args) {
			assert(is [Context,Source,Class<Destination>] args);
			return descriptor.describe(*args);
		}
		string = "Descriptor - ``descriptor``";	
	};
	
	shared actual Executable adaptResolver<Output, OutputType, Input>(TypedResolver<Output,OutputType,Input> resolver) => object satisfies Executable{
		shared actual Anything execute(Anything[] args) {
			assert(is [Context,Input,OutputType] args);
			return resolver.resolve(*args);
		}
		string = "Resolver - ``resolver``";	
	};
	
};

