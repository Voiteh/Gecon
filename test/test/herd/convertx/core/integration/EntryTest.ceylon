import ceylon.test {
	test,
	parameters
}
import herd.convertx.core {
	Convertx
}
shared class EntryTest() {
	
	
	shared test
	parameters(`value defaultIntegrationParameters`)
	void shouldConvertEntryToEntry(Convertx convertx){
		assert(is String->Integer result=convertx.convert(3->"4", `String->Integer`));
		assert(result.key=="3");
		assert(result.item==4);
		
	}
	
	
	
	
}