import ceylon.language.meta.model {
	Class
}



import herd.convertx.api.operation {
	Creation
}

shared interface Creator<Args,Result> satisfies  Creation<Args,Result,Result> {
	
	throws (`class ConvertionException`)
	shared formal actual Result create(Context context,Class<Result> kind, Args arguments);


	shared actual default Creator<Args,Result >.Matcher? matcher => null;
}


