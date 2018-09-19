import ceylon.collection {
	HashMap
}
import herd.convertx.core.api.component {
	Component,
	TypedResolver,
	TypedCreator,
	TypedConverter
}



import herd.convertx.core {
	logger
}

shared alias ComponentContainer => HashMap<Findable,Executable>;
ComponentContainer componentContainer=> HashMap<Findable,Executable>();
shared class OldRegistry {
	shared ComponentContainer converters=componentContainer;
	shared ComponentContainer resolvers=componentContainer;
	shared ComponentContainer creators=componentContainer;
	
	Findable.Adapter findableAdapter=defaultFindableAdapter;
	Executable.Adapter executableAdapter=defaultExecutableAdapter;
	
	
	shared sealed new(Component[] components){
		
		components.each((Component element) {
			value findable=element.toFindable(findableAdapter);
			value executable=element.toExecutable(executableAdapter);
			Executable? replaced;
			switch(element)
			case (is TypedConverter<>) {
				replaced=converters.put(findable,executable);
			}
			case (is TypedResolver<>) {
				replaced=resolvers.put(findable, executable);
			}
			case (is TypedCreator<>) {
				replaced=creators.put(findable, executable);
			}
			logger.trace("Registered: ``element``");
			if(exists replaced){
				logger.warn("Replaced: ``replaced``, with: ``executable``");
			}
		});
	}
	
	
	
	
	
}