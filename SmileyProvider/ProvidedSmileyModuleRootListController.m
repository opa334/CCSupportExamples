#include "ProvidedSmileyModuleRootListController.h"

@implementation ProvidedSmileyModuleRootListController

- (NSArray *)specifiers
{
	if(!_specifiers)
	{
		_specifiers = [self loadSpecifiersFromPlistName:@"SmileyPrefs" target:self];

		if(self.settingsIdentifier)
		{
			for(PSSpecifier* specifier in _specifiers)
			{
				[specifier setProperty:self.settingsIdentifier forKey:@"defaults"];
			}
		}
	}

	[(UINavigationItem *)self.navigationItem setTitle:self.displayName];

	return _specifiers;
}

- (NSArray*)smileyTitles
{
	return @[@":(", @":|", @":)"];
}

- (NSArray*)smileyValues
{
	return @[@-1, @0, @1];
}

@end
