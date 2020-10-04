#include "SMPRootListController.h"

@implementation SMPRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

- (void)closeKeyboard
{
	[self.view endEditing:YES];
}

@end
