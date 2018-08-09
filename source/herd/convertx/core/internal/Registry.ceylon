import ceylon.collection {
	HashMap
}
import herd.convertx.core.api.component {
	Component,
	TypedResolver,
	TypedCreator,
	TypedConverter,
	TypedDescriptor
}

shared alias Container => HashMap<Findable,Executable>;
Container container=> HashMap<Findable,Executable>();
shared class Registry {
	shared Container converters=container;
	shared Container resolvers=container;
	shared Container creators=container;
	shared Container descriptors=container;
	
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
			case (is TypedDescriptor<>) {
				replaced=descriptors.put(findable, executable);
			}
			if(exists replaced){
				//TODO make a real Log
				print("Warning! Replaced: ``replaced``, with: ``executable``");
			}
		});
		
	}
	
	
	
	
	
}