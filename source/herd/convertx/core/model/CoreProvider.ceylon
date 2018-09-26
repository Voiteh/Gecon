import herd.convertx.api.support {
	WireingProvider
}
import herd.convertx.api.component {
	Component
}
import herd.convertx.api.configuration {
	Configuration
}

shared class CoreProvider(
	{Component*} additionalComponents={},
	{Configuration*} additionalConfiguration={}
) extends WireingProvider(`module`,additionalComponents,additionalConfiguration) {}
