import herd.convertx.core.api.component {
	Component
}
import ceylon.collection {
	MutableList
}
shared interface Provider {
	
	shared formal MutableList<Component> components;
}