import herd.convertx.core.api.component {
	Component
}
import ceylon.collection {
	MutableList
}
import herd.convertx.core.api.configuration {
	Configuration
}
shared interface Provider {
	shared formal MutableList<Component> components;
	shared formal MutableList<Configuration> configurations;
}