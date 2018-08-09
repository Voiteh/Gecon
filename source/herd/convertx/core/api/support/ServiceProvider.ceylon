import herd.convertx.core.api {
	Provider
}
import ceylon.language.meta.declaration {
	Module
}
import herd.convertx.core.api.component {
	Component
}
shared class ServiceProvider(Module* modules) satisfies Provider{
	shared actual {Component*} components => modules.flatMap((Module element) {
		 try{
		 	return element.findServiceProviders(`Component`);
		 }catch(Exception x){
		 	print(x);
		 	return empty;
		 }
	});
	
}