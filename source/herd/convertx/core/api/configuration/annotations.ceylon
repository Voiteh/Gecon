import ceylon.language.meta.declaration {
	ClassDeclaration
}
shared annotation final class ConfigurationAnnotation() satisfies OptionalAnnotation<ConfigurationAnnotation, ClassDeclaration>{}
shared annotation ConfigurationAnnotation configuration() =>ConfigurationAnnotation();