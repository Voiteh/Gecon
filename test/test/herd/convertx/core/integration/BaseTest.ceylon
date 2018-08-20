import herd.convertx.core.api {
	Provider
}
import herd.convertx.core {
	Convertx
}
shared class BaseTest() {
		
		shared default {Provider*} additionalProviders =>{};
	
		shared default Convertx convertx=>Convertx(*additionalProviders);
	
	
	
}