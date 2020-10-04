#import "ProvidedSmileyModule.h"

#import <ControlCenterUI/ControlCenterUI-Structs.h>
#import <ControlCenterUIKit/CCUIToggleViewController.h>

@implementation ProvidedSmileyModule

- (instancetype)init
{
	self = [super init];

	//calling reconfigureView reloads the icons
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reconfigureView) name:@"smileyprovider/ReloadSmileys" object:nil];

	return self;
}

- (CCUILayoutSize)moduleSizeForOrientation:(int)orientation
{
	CCUILayoutSize size;
	NSNumber *width, *height;

	if(orientation == 0)
	{
		width = [[[NSUserDefaults standardUserDefaults] persistentDomainForName:self.settingsIdentifier] objectForKey:@"PortraitWidth"];
		height = [[[NSUserDefaults standardUserDefaults] persistentDomainForName:self.settingsIdentifier] objectForKey:@"PortraitHeight"];
	}
	else
	{
		width = [[[NSUserDefaults standardUserDefaults] persistentDomainForName:self.settingsIdentifier] objectForKey:@"LandscapeWidth"];
		height = [[[NSUserDefaults standardUserDefaults] persistentDomainForName:self.settingsIdentifier] objectForKey:@"LandscapeHeight"];
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

- (NSInteger)inactiveSmiley
{
	NSInteger value = 0;

	NSNumber* prefNum = [[[NSUserDefaults standardUserDefaults] persistentDomainForName:self.settingsIdentifier] objectForKey:@"inactiveSmiley"];
	if(prefNum)
	{
		value = [prefNum integerValue];
	}

	return value;
}

- (NSInteger)activeSmiley
{
	NSInteger value = 1;

	NSNumber* prefNum = [[[NSUserDefaults standardUserDefaults] persistentDomainForName:self.settingsIdentifier] objectForKey:@"activeSmiley"];
	if(prefNum)
	{
		value = [prefNum integerValue];
	}

	return value;
}

- (UIImage *)iconForSmiley:(NSInteger)smiley
{
	NSString* imageName;

	if(smiley < 0)
	{
		imageName = @"Smiley_Sad"; 
	}
	else if(smiley > 0)
	{
		imageName = @"Smiley_Happy";
	}
	else
	{
		imageName = @"Smiley_Neutral";
	}

	NSLog(@"iconForSmiley:%li = %@", (long)smiley, imageName);

	return [UIImage imageNamed:imageName inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
}

//Return the icon of your module here
- (UIImage *)iconGlyph
{
	return [self iconForSmiley:[self inactiveSmiley]];
}

- (UIImage *)selectedIconGlyph
{
	return [self iconForSmiley:[self activeSmiley]];
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
