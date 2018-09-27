import herd.modaco.api.configuration {
	Configuration
}
import herd.modaco.api.operation {
	Operation
}
shared interface Provider {
	shared formal {Operation*} operations;
	shared formal {Configuration*} configurations;
}
