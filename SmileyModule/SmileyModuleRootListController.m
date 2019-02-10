#include "SmileyModuleRootListController.h"

@implementation SmileyModuleRootListController

- (NSArray *)specifiers
{
	if(!_specifiers)
  {
		_specifiers = [[self loadSpecifiersFromPlistName:@"ModulePrefs" target:self] retain];
	}

	return _specifiers;
}

@end
