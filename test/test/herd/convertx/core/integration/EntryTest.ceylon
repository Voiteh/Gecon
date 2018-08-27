import ceylon.test {
	test
}
shared class EntryTest() extends BaseTest(){
	
	
	shared test
	void shouldConvertEntryToEntry(){
		assert(is String->Integer result=convertx.convert(3->"4", `String->Integer`));
		assert(result.key=="3");
		assert(result.item==4);
		
	}
	
	
	
	
}