
import herd.convertx.core.api.logicals {
	Configurator
}
import herd.convertx.core.util {
	extractObjectType
}
import herd.convertx.core.api.configuration {
	Configurable
}
shared class DefaultConfigurator() satisfies Configurator{
	shared actual void configure(Object target, {Object*} configurations) {
		configurations.each((Object element) {
			value configType=extractObjectType(element);
			if(configType.typeOf(target)){
				value configurableType=`interface Configurable`.apply<Configurable<>>(configType);
				value configurableMethod=`function Configurable.configure`.memberApply<Configurable<>,Anything>(configurableType);
				configurableMethod.bind(target).apply(element);
			}
		});
		
		
	}
	
	
	
	
	
	
}