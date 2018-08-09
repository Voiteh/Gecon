import ceylon.test {
	test
}
import herd.convertx.core {
	Convertx
}
shared class EntryIntegrationTest() {
	
	value convertx=Convertx();
	
	
	shared test
	void shouldConvertEntryToEntry(){
		assert(is String->Integer result=convertx.convert(3->"4", `String->Integer`));
		assert(result.key=="3");
		assert(result.item==4);
		
	}
	
	
	
	
}