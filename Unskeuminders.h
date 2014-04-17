#import <UIKit/UIKit.h>

@interface RemindersCardBackgroundView : UIView
+ (id)roundedTextureImage;
-(void)useScrollingTexture:(BOOL)arg1;
@end

@interface RemindersScrollingBackgroundView : UIView
+ (id)kitPaperTextureImage;
-(void)setTextureImage:(id)arg1;
@end

@interface _UIResizableImage : UIImage

+ (BOOL)supportsSecureCoding;

- (void)_configureFromImage:(id)arg1;
- (CGRect)_contentInsetsInPixels:(UIEdgeInsets)arg1 emptySizeFallback:(id)arg2;
- (CGRect)_contentRectInPixels;
- (CGRect)_contentStretchInPixels;
- (id)_initWithOtherImage:(id)arg1;
- (BOOL)_isResizable;
- (BOOL)_isSubimage;
- (BOOL)_isTiledWhenStretchedToSize:(CGSize)arg1;
- (id)_resizableImageWithCapMask:(int)arg1;
- (void)_setAlwaysStretches:(BOOL)arg1;
- (void)_setCapInsets:(UIEdgeInsets)arg1;
- (void)_setSubimageInsets:(UIEdgeInsets)arg1;
- (BOOL)_suppressesAccessibilityHairlineThickening;
- (UIEdgeInsets)capInsets;
- (void)encodeWithCoder:(id)arg1;
- (id)initWithCoder:(id)arg1;
- (id)initWithImage:(id)arg1 capInsets:(UIEdgeInsets)arg2;
- (int)resizingMode;
@end
