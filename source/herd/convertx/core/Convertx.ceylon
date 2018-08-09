import herd.convertx.core.api {
	Provider,
	Context
}
import herd.convertx.core.internal {
	Registry
}
import herd.convertx.core.model {
	DefaultContext,
	CoreProvider
}
import ceylon.language.meta.model {
	Type
}
import herd.convertx.core.api.component {
	AdaptationException
}

shared class Convertx {
	
	Context context;
	
	shared new (Provider* userProviders) {
		value components = CoreProvider()
			.components
			.chain(userProviders
				.flatMap((Provider element) => element.components))
			.sequence();
		value registry = Registry(components);
		context = DefaultContext(registry);
	}
	
	shared new custom(Context context) {
		this.context = context;
	}
	
	shared Result|AdaptationException convert<Result>(Anything source, Type<Result> resultType) {
		try {
			return context.convert(source, resultType);
		} catch (AdaptationException x) {
			return x;
		}
	}
}
