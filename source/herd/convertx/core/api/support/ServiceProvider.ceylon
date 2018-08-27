import herd.convertx.core.api {
	Provider
}
import ceylon.language.meta.declaration {
	Module
}
import herd.convertx.core.api.component {
	Component
}
import ceylon.collection {
	ArrayList,
	MutableList
}

shared class ServiceProvider(Module* modules) satisfies Provider {
	shared actual MutableList<Component> components {
		value list = ArrayList<Component>();
		for (\imodule in modules) {
			list.addAll(\imodule.findServiceProviders(`Component`));
		}
		return list;
	}
}
