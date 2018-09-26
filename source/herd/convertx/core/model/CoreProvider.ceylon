import herd.convertx.core.api.support {
	WireingProvider
}
import herd.convertx.core.api.component {
	Component
}
import herd.convertx.core.api.configuration {
	Configuration
}

shared class CoreProvider(
	{Component*} additionalComponents={},
	{Configuration*} additionalConfiguration={}
) extends WireingProvider(`module`,additionalComponents,additionalConfiguration) {}
