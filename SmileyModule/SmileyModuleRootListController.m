#include "SmileyModuleRootListController.h"

@implementation SmileyModuleRootListController

- (NSArray *)specifiers
{
	if(!_specifiers)
	{
		_specifiers = [self loadSpecifiersFromPlistName:@"ModulePrefs" target:self];
	}

	return _specifiers;
}

@end
