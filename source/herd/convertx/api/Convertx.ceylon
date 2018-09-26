import ceylon.language.meta.model {
	Type
}
import herd.convertx.api.component {
	ConvertxException
}
import herd.convertx.api {
	Context
}
shared class Convertx{
	
	Context context;
	
	shared new (Context context){
		this.context=context;
	}
	
	
	shared Result|ConvertxException convert<Result>(Anything source, Type<Result> resultType){
		try {
			value result =context.convert(source, resultType);
			return result;
		} catch (ConvertxException x) {
			return x;
		}
	}
}