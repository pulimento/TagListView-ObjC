//
//  ViewController.m
//  TagObjc
//
//  Created by Javi Pulido on 16/7/15.
//  Copyright (c) 2015 Javi Pulido. All rights reserved.
//

#import "ViewController.h"
#import "TagListView.h"
#import "TagView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet TagListView *tagListView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Add tags programmatically
    [[self.tagListView addTag:@"Those"] setOnTap:^(TagView *tagView) {
        NSLog(@"on tap tagView:%@", tagView);
    }];
    [self.tagListView addTag:@"are"];
    [self.tagListView addTag:@"some"];
    [self.tagListView addTag:@"example"];
    [self.tagListView addTag:@"tags"];
    [self.tagListView addTagsAccordingToDataSourceArray:@[@"from", @"array", @"too"] withOnTapForEach:^(TagView *tagView) {
        tagView.backgroundColor = [UIColor blueColor];
    }];
    
    UIGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(listPressed)];    
    [self.tagListView addGestureRecognizer:recognizer];
}

- (void)listPressed {
    [[self tagListView] addTag:[NSString stringWithFormat:@"%@",[NSDate date]]];
}

@end
