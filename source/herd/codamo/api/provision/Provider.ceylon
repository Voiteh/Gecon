import herd.codamo.api.configuration {
	Configuration
}
import herd.codamo.api.operation {
	Operation
}
shared interface Provider {
	shared formal {Operation*} operations;
	shared formal {Configuration*} configurations;
}
