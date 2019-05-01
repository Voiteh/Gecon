import ceylon.language.meta.model {
	Attribute
}
import ceylon.test {
	test,
	assertEquals
}

import herd.gecon.transformer.core.support.mapper {
	AttributeMapper
}
import herd.gecon.api.transformer {
	Relation
}

class SimpleModel(
	shared String name,
	shared Integer val) {}

class OtherModel(
	shared Boolean active,
	shared String definiton) {}
class PersonDb(Integer id,shared String personName,shared Integer personAge){}
class PersonDto(shared String name,shared Integer age ){}

Attribute<PersonDto>? mapAttributes(Attribute<PersonDb> dbAttribute) =>
	if(dbAttribute==`PersonDb.personAge`) then `PersonDto.age` 
	else if(dbAttribute==`PersonDb.personName`) then `PersonDto.name`
	else null;



object simpleModelAttributeMapper extends AttributeMapper<SimpleModel,OtherModel>() {
	shared actual Anything extractSourceValue(Attribute<OtherModel> resultAttribute, SimpleModel source) {
		return if (`OtherModel.active` == resultAttribute) then source.name
		else if (`OtherModel.definiton` == resultAttribute) then source.val
			else null;
	}
}

shared class AttributeMapperTest() {
	
	shared test
	void shouldMappModelAttributes() {
		value map = simpleModelAttributeMapper.map(Relation(SimpleModel("abc", 123), `OtherModel`));
		assertEquals(map.get(`OtherModel.active`),"abc");
		assertEquals(map.get(`OtherModel.definiton`),123);
	}
}
