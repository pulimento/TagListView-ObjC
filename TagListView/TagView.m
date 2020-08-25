//
//  TagView.m
//  TagObjc
//
//  Created by Javi Pulido on 16/7/15.
//  Copyright (c) 2015 Javi Pulido. All rights reserved.
//

#import "TagView.h"

@implementation TagView

@synthesize textColor =_textColor;
@synthesize textFont = _textFont;

- (instancetype) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if(self) {
        [self setupView];
    }
    return self;
}

- (instancetype) initWithTitle:(NSString *)title {
    self = [super init];
    if(self) {
        [self setTitle:title forState:UIControlStateNormal];
        [self setupView];
    }
    return self;
}

- (void)setupView {
    CGSize intrinsicSize = [self intrinsicContentSize];
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, intrinsicSize.width, intrinsicSize.height);
}

# pragma mark - Getters (default values)

- (UIColor *)textColor {
    if(!_textColor) {
        _textColor = [UIColor whiteColor];
    }
    return _textColor;
}

- (UIFont *)textFont {
    if(!_textFont) {
        _textFont = [UIFont systemFontOfSize:12];
    }
    return _textFont;
}

# pragma mark - Setters

- (void)setCornerRadius:(CGFloat)cornerRadius {
    _cornerRadius = cornerRadius;
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = self.cornerRadius > 0;
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    _borderWidth = borderWidth;
    self.layer.borderWidth = borderWidth;
}

- (void)setBorderColor:(UIColor *)borderColor {
    _borderColor = borderColor;
    self.layer.borderColor = borderColor.CGColor;
    [self reloadStyles];
}

- (void)setTextColor:(UIColor *)textColor {
    _textColor = textColor;
    [self setTitleColor:textColor forState:UIControlStateNormal];
    [self reloadStyles];
}

- (void)selectedTextColor:(UIColor *)selectedTextColor {
    _selectedTextColor = selectedTextColor;
    [self setTitleColor:selectedTextColor forState:UIControlStateSelected];
    [self reloadStyles];
}

- (void)setPaddingY:(CGFloat)paddingY {
    _paddingY = paddingY;
    UIEdgeInsets insets = [self titleEdgeInsets];
    insets.top = paddingY;
    insets.bottom = paddingY;
    [self setTitleEdgeInsets:insets];
}

- (void)setPaddingX:(CGFloat)paddingX {
    _paddingX = paddingX;
    UIEdgeInsets insets = [self titleEdgeInsets];
    insets.left = paddingX;
    insets.right = paddingX;
    [self setTitleEdgeInsets:insets];
}

- (void)setTextFont:(UIFont *)textFont {
    _textFont = textFont;
    [self.titleLabel setFont:textFont];
}

- (void)setTagBackgroundColor:(UIColor *)tagBackgroundColor {
    _tagBackgroundColor = tagBackgroundColor;
    [self setBackgroundColor:tagBackgroundColor];
    [self reloadStyles];
}

- (void)setHighlightedBackgroundColor:(UIColor *)highlightedBackgroundColor {
    _highlightedBackgroundColor = highlightedBackgroundColor;
    [self reloadStyles];
}

- (void)setSelectedBackgroundColor:(UIColor *)selectedBackgroundColor {
    _selectedBackgroundColor = selectedBackgroundColor;
    [self reloadStyles];
}

- (void)setSelectedBorderColor:(UIColor *)selectedBorderColor {
    _selectedBorderColor = selectedBorderColor;
    [self reloadStyles];
}


- (void)setIsHighlighted:(BOOL)isHighlighted{
    _isHighlighted = isHighlighted;
    [self reloadStyles];
}

- (void)setIsSelected:(BOOL)isSelected{
    _isSelected = isSelected;
    [self reloadStyles];
}



# pragma mark - Methods

- (CGSize) intrinsicContentSize {
    CGSize size = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName: self.titleLabel.font}];
    
    size.height = self.titleLabel.font.pointSize + self.paddingY * 2;
    size.width += self.paddingX * 2;
    
    if(size.width < size.height) {
        size.width = size.height;
    }
    
    return size;
}

- (void)reloadStyles {
    if(self.isHighlighted) {
        if([self highlightedBackgroundColor]) {
            [self setBackgroundColor:[self highlightedBackgroundColor]];
        }
    } else if (self.isSelected) {
        if([self selectedBackgroundColor]) {
            [self setBackgroundColor:[self selectedBackgroundColor]];
        } else {
            [self setTagBackgroundColor:[self tagBackgroundColor]];
        }
        if([self selectedBorderColor]) {
            [[self layer] setBorderColor:[[self selectedBorderColor] CGColor]];
        } else {
            [[self layer] setBorderColor:[[self borderColor] CGColor]];
        }
        [self setTitleColor:[self selectedTextColor] forState:UIControlStateNormal];
    } else {
        [self setBackgroundColor:[self tagBackgroundColor]];
        [[self layer] setBorderColor:[[self borderColor] CGColor]];
        [self setTitleColor:[self textColor] forState:UIControlStateNormal];
    }
}

@end
