import herd.gecon.core.engine {

	AutoProvider,
	Gecon,
	ScopeProvisioning
}

serializable class ProductDto(
	shared String? id,
	shared String? name
) {}

serializable class Product(
	shared Integer id,
	shared String name
){
	string => "id: ``id``, name: ``name``";
	
}

"Run the module `model.to.model`."
shared void run() {
	value gecon = Gecon {
		provider = AutoProvider {
			transformations = ScopeProvisioning(
				[
				`module herd.gecon.core.transformer`
				]
			);
		};
	};
	value dto=ProductDto("123","Door");
	value product = gecon.convert(dto, `Product`);
	print(product);
}