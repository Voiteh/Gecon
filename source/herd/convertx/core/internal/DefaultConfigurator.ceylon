

import herd.convertx.core.util {
	typeHierarchy,
	runtimeCall
}
import herd.convertx.core.api.configuration {
	Configurable,
	Configurator,
	Configuration
}
import ceylon.language.meta {
	type
}
import ceylon.language.meta.model {
	Type
}
import ceylon.language.meta.declaration {
	Package
}
shared class DefaultConfigurator() satisfies Configurator{
		
		shared actual void configure(Configurable<Configuration> configurable, {Configuration*} configurations) {
			
			value configurableType=type(configurable);
			value \imodule=configurableType.declaration.containingModule;
			value \ipackage=configurableType.declaration.containingPackage;
			assert(exists exactConfigurableType=typeHierarchy(type(configurable)).findByDeclaration(`interface Configurable`));
			assert(is Type<Configuration> configType = exactConfigurableType.typeArgumentList.first);
			value narrowed = runtimeCall.iterable.narrow(configurations, configType);
			value filtered=narrowed.filter((Configuration element) {
				switch(category=element.category)
				case(is Package){
					return \ipackage ==category;
				}
				else {
					return \imodule==category;
				}
			});
			filtered.each((Configuration element) => configurable.configure(element));
		}
		
		
		
	
	
	
	
	
	
}