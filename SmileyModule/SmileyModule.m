#import "SmileyModule.h"

#import <ControlCenterUI/ControlCenterUI-Structs.h>

@implementation SmileyModule

- (CCUILayoutSize)moduleSizeForOrientation:(int)orientation
{
	CCUILayoutSize size;
	NSNumber *width, *height;

	if(orientation == 0)
	{
		width = [[[NSUserDefaults standardUserDefaults] persistentDomainForName:@"com.opa334.smileymoduleprefs"] objectForKey:@"PortraitWidth"];
		height = [[[NSUserDefaults standardUserDefaults] persistentDomainForName:@"com.opa334.smileymoduleprefs"] objectForKey:@"PortraitHeight"];
	}
	else
	{
		width = [[[NSUserDefaults standardUserDefaults] persistentDomainForName:@"com.opa334.smileymoduleprefs"] objectForKey:@"LandscapeWidth"];
		height = [[[NSUserDefaults standardUserDefaults] persistentDomainForName:@"com.opa334.smileymoduleprefs"] objectForKey:@"LandscapeHeight"];
	}

	if(height)
	{
		size.height = [height unsignedLongLongValue];
	}
	else
	{
		//Default value
		size.height = 1;
	}

	if(width)
	{
		size.width = [width unsignedLongLongValue];
	}
	else
	{
		//Default value
		size.width = 1;
	}

	return size;
}

//Return the icon of your module here
- (UIImage *)iconGlyph
{
	return [UIImage imageNamed:@"Smiley-Meh" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
}

- (UIImage *)selectedIconGlyph
{
	return [UIImage imageNamed:@"Smiley-Happy" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
}

//Return the color selection color of your module here
- (UIColor *)selectedColor
{
	return [UIColor redColor];
}

- (BOOL)isSelected
{
	return _selected;
}

- (void)setSelected:(BOOL)selected
{
	_selected = selected;

	[super refreshState];
}

@end
