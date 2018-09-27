import herd.convertx.api.configuration {
	Configuration
}
import herd.convertx.api.operation {
	Operation
}
shared interface Provider {
	shared formal {Operation*} operations;
	shared formal {Configuration*} configurations;
}
