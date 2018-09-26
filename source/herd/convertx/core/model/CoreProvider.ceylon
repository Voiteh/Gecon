import herd.convertx.api.support {
	WireingProvider
}
import herd.convertx.api.operation {
	Operation
}
import herd.convertx.api.configuration {
	Configuration
}

shared class CoreProvider(
	{Operation*} additionalComponents={},
	{Configuration*} additionalConfiguration={}
) extends WireingProvider(`module`,additionalComponents,additionalConfiguration) {}
