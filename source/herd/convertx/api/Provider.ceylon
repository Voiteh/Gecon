import herd.convertx.api.component {
	Component
}
import herd.convertx.api.configuration {
	Configuration
}
shared interface Provider {
	shared formal {Component*} components;
	shared formal {Configuration*} configurations;
}
