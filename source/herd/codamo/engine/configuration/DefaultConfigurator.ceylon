import herd.codamo.api.core.util {
	typeHierarchy,
	runtimeCall
}
import herd.codamo.api.core.configuration {
	Configurable,
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


"Default configurator implementation"
shared class DefaultConfigurator() satisfies Configurator {
	
	shared actual void configure(Object configurable, {Configuration*} configurations) {
		
		value configurableType = type(configurable);
		value \imodule = configurableType.declaration.containingModule;
		value \ipackage = configurableType.declaration.containingPackage;
		if (exists exactConfigurableType = typeHierarchy(type(configurable)).findByDeclaration(`interface Configurable`)) {
			assert (is Type<Configuration> configType = exactConfigurableType.typeArgumentList.first);
			value configure = `function Configurable.configure`.memberApply<>(configurableType)
				.bind(configurable);
			value narrowed = runtimeCall.iterable.narrow(configurations, configType);
			value filtered = narrowed.filter((Configuration element) {
					switch (category = element.scope)
					case (is Package) {
						return \ipackage == category;
					}
					else {
						return \imodule == category;
					}
				});
			filtered.each((Configuration element) => configure.apply(element));
		}
	}
}
