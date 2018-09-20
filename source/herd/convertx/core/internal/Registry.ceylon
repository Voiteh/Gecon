import herd.convertx.core.api.component {
	Visitor,
	Component,
	TypedConverter,
	TypedResolver,
	TypedCreator,
	Executable
}
import herd.convertx.core {
	logger
}
shared class Registry {
	
	shared Container converters=Container();
	shared Container resolvers=Container();
	shared Container creators=Container();
	
	shared new(Component[] components,Visitor visitor=DefaultVisitor()){
		components.each((Component element) {
			value flat=element.register(visitor);
			Executable? replaced;
			switch(element)
			case (is TypedConverter<>) {
				replaced=converters.put(*flat);
			}
			case (is TypedResolver<>) {
				replaced=resolvers.put(*flat);
			}
			case (is TypedCreator<>) {
				replaced=creators.put(*flat);
			}
			logger.trace("Registered: ``element``");
			if(exists replaced){
				logger.warn("Replaced: ``replaced``, with: ``element``");
			}
		});
		
	}
	
	
}