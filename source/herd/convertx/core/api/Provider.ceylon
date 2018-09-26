import herd.convertx.core.api.component {
	Component
}
import herd.convertx.core.api.configuration {
	Configuration
}
shared interface Provider {
	shared formal {Component*} components;
	shared formal {Configuration*} configurations;
}
