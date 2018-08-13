import herd.convertx.core.api.component.support {
	AttributeDescriptor
}
import herd.convertx.core {
	Convertx
}

shared [Convertx] defaultIntegrationParameters=[Convertx()];


shared abstract class EnumOne() of first|second|third|fourth{}
shared object first extends EnumOne() {}
shared object second extends EnumOne(){}
shared object third extends EnumOne(){}
shared object fourth extends EnumOne(){}

shared interface EnumTwo of one|two|three{}
shared object one satisfies EnumTwo{}
shared object two satisfies EnumTwo{}
shared object three satisfies EnumTwo{}

shared serializable class TestSimpleModel(id,name){
	shared Integer id;
	shared String name;
	
}

shared serializable class TestOtherSimpleModel(id,name){
	shared String id;
	shared Integer name;
}


shared AttributeDescriptor<TestSimpleModel, TestOtherSimpleModel> simpleModelToOtherAttributeDescriptor = AttributeDescriptor<TestSimpleModel, TestOtherSimpleModel>{
	attributes={
		`TestSimpleModel.id`->`TestOtherSimpleModel.id`,
		`TestSimpleModel.name`->`TestOtherSimpleModel.name`
	};
};